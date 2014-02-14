# GoCoin Currency Conversions
#
class CurrencyConversions

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "CurrencyConversions::create called."
    route = "/merchants/#{params.mid}/currency_conversions"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (params, callback) ->
    @api.client.logger.debug "CurrencyConversions::get called."
    route = "/merchants/#{params.mid}/currency_conversions/#{params.conversion_id}"
    options = {}
    @api.request(route, options, callback)

  list: (id, callback) ->
    @api.client.logger.debug "CurrencyConversions::list called."
    route = "/merchants/#{id}/currency_conversions"
    options = {}
    @api.request(route, options, callback)

module.exports = CurrencyConversions
