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

  request: (route, options, callback) ->
    # Do stuff.
    console.log "Api::request called."
    console.log (@client.token)
    unless @client.token 
      throw new Error 'Api is not ready'

    headers = if options.headers? then _.defaults(options.headers, @client.headers) else _.defaults {}, @client.headers
    headers['Authorization'] = "Bearer #{@client.token}"

    options = _.defaults options, @client.options
    body = if options.body? then JSON.stringify(body) else null

    #Configure Request
    config =
      host: options.host
      path: "#{options.path}#{options.api_version}#{route}"
      method: options.method
      port: @client.port()
      headers: headers
      body: body

    @client.raw_request(config, callback)

module.exports = Api
