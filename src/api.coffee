_           = require 'underscore'

Merchant    = require './api/merchant'
User        = require './api/user'
Apps        = require './api/apps'
Invoices    = require './api/invoices'
Accounts    = require './api/accounts'

# The API interface for working with GoCoin resources.
#
class Api

  constructor: (@client) ->
    console.log "Api::constructor called."
    @user = new User(@)
    @merchant = new Merchant(@)
    @apps = new Apps(@)
    @invoices = new Invoices(@)
    @accounts = new Accounts(@)

  request: (route, options, callback) ->
    # Do stuff.
    console.log "Api::request called."
    throw new Error 'Api Request: Route was not defined' unless route? && _.isString(route)
    if _.isFunction(options)
      callback = options
      options = {}
    throw new Error 'Api Request: Options is not an object' unless _.isObject(options)
    throw new Error 'Api Request: Callback is not defined' unless callback? && _.isFunction(callback)  
    throw new Error 'Api not ready: Token was not defined' unless @client.token 

    headers = if options.headers? then _.defaults(options.headers, @client.headers) else _.defaults {}, @client.headers
    headers['Authorization'] = "Bearer #{@client.token}"

    options = _.defaults options, @client.options
    body = if options.body? then JSON.stringify(options.body) else null

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
