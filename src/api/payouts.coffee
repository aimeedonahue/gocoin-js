# GoCoin Currency Conversions
#
class Payouts

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "Payouts::create called."
    route = "/merchants/#{params.mid}/payouts"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (params, callback) ->
    @api.client.logger.debug "Payouts::get called."
    route = "/merchants/#{params.mid}/payouts/#{params.conversion_id}"
    options = {}
    @api.request(route, options, callback)

  list: (id, callback) ->
    @api.client.logger.debug "Payouts::list called."
    route = "/merchants/#{id}/payouts"
    options = {}
    @api.request(route, options, callback)

module.exports = Payouts
