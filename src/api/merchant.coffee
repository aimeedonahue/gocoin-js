# GoCoin Merchant
#
class Merchant

  constructor: (@api) ->
    console.log "Merchant::constructor called."

  create: (params, callback) ->
    console.log "Merchant::create called."
    route = '/merchants'
    options = 
      method: 'POST'
      body: params
    @api.request(route, options, @api.handler(callback))

  delete: (id, callback) ->
    console.log "Merchant::delete called."
    route = "/merchants/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, @api.handler(callback))

  get: (id, callback) ->
    console.log "Merchant::get called."
    route = "/merchants/#{id}"
    options = {}
    @api.request(route, options, @api.handler(callback))

  list: (callback) ->
    console.log "Merchant::list called."
    route = '/merchants'
    options = {}
    @api.request(route, options, @api.handler(callback))

  update: (params, callback) ->
    console.log "Merchant::update called."
    route = "/merchants/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, @api.handler(callback))

module.exports = Merchant
