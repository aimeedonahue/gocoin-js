# GoCoin Accounts
#
class Accounts

  constructor: (@api) ->
    console.log "Accounts::constructor called."

  create: (params, callback) ->
    console.log "Accounts::create called."
    route = "/merchants/#{params.id}/accounts"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (id, callback) ->
    console.log "Accounts::get called."
    route = "/accounts/#{id}"
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    console.log "Accounts::update called."
    route = "/accounts/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

  list: (callback) ->
    console.log "Accounts::list called."
    route = "/merchants/#{id}/accounts"
    options = {}
    @api.request(route, options, callback)

  delete: (id, callback) ->
    console.log "Accounts::delete called."
    route = "/accounts/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)

  verify: (params, callback) ->
    console.log "Accounts::verify called."
    route = "/accounts/#{params.id}/verifications"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

module.exports = Accounts
