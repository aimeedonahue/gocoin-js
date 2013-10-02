# GoCoin Invoices
#
class Invoices

  constructor: (@api) ->
    console.log "Invoices::constructor called."

  create: (params, callback) ->
    console.log "Invoices::create called."
    route = "/merchants/#{params.id}/invoices"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, @api.handler(callback))

  get: (id, callback) ->
    console.log "Invoices::get called."
    route = "/invoices/#{id}"
    options = {}

    @api.request(route, options, @api.handler(callback))

module.exports = Invoices
