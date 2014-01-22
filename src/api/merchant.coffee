# GoCoin Merchant
#
class Merchant

  constructor: (@api) ->

  get: (id, callback) ->
    @api.client.logger.debug "Merchant::get called."
    route = "/merchants/#{id}"
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "Merchant::update called."
    route = "/merchants/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

  getSplit: (params, callback) ->
    @api.client.logger.debug "Merchant::getSplit called."
    route = "/merchants/#{params.merchant_id}/merchant_splits/#{params.currency_code}"
    options = {}
    @api.request(route, options, callback)

  setSplit: (params, callback) ->
    @api.client.logger.debug "Merchant::setSplit called."
    route = "/merchants/#{params.merchant_id}/merchant_splits/#{params.currency_code}"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

module.exports = Merchant
