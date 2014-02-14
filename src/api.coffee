_           = require 'underscore'

Merchant    = require './api/merchant'
PayoutAddrs = require './api/merchantpayoutaddresses'
User        = require './api/user'
Invoices    = require './api/invoices'
Accounts    = require './api/accounts'
CurrConvers = require './api/currency_conversions'
Payouts     = require './api/payouts'

# The API interface for working with GoCoin resources.
#
class Api

  constructor: (@client) ->
    @user = new User(@)
    @merchant = new Merchant(@)
    @invoices = new Invoices(@)
    @accounts = new Accounts(@)
    @merchantpayoutaddresses = new PayoutAddrs(@)
    @currency_conversions = new CurrConvers(@)
    @payouts = new Payouts(@)
    @add_extensions()

  request: (route, options, callback) ->
    # Do stuff.
    @client.logger.debug "Api::request called."
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
      port: @client.port(options.secure)
      headers: headers
      body: body

    @client.raw_request config, callback

  add_extensions: () ->
    # This method is essentially a secondary constructor
    @client.logger.debug 'No extensions to add'

module.exports = Api
