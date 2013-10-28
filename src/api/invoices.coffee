# GoCoin Invoices
#
class Invoices

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "Invoices::create called."
    route = "/merchants/#{params.id}/invoices"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (id, callback) ->
    @api.client.logger.debug "Invoices::get called."
    route = "/invoices/#{id}"
    options = {}
    @api.request(route, options, callback)

module.exports = Invoices
