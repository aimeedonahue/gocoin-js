_ = require 'underscore'

Merchant = require './api/merchant'
User     = require './api/user'

# The API interface for working with GoCoin resources.
#
class Api

  constructor: (@client) ->
    console.log "Api::constructor called."
    @user = new User(@)
    @merchant = new Merchant(@)

  handler: (callback) ->
      (
        (response) -> 
          console.log "Status: #{response.statusCode}"
          response_data = ''
          response.on 'data', (chunk) ->
            response_data += chunk
          response.on 'end', () ->
            data = JSON.parse(response_data);
            console.log response_data
            callback(response, data)
        )

  request: (route, options, callback) ->
    # Do stuff.
    console.log "Api::request called."
    unless @client.token 
      throw new Error 'Api is not ready'

    headers = if options.headers? then _.defaults(options.headers, @client.headers) else _.defaults {}, @client.headers
    headers['Authorization'] = "Bearer #{@client.token}"

    options = _.defaults options, @client.options
    body = if options.body? then JSON.stringify(body) else null

    #Configure Request
    config =
      host: options.host
      path: "#{options.path}/#{options.api_version}#{route}"
      method: options.method
      port: @client.port()
      headers: headers
      body: body

    @client.raw_request config, callback

module.exports = Api
