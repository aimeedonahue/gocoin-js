# GoCoin Accounts
#
class Accounts

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "Accounts::create called."
    route = "/merchants/#{params.id}/accounts"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (id, callback) ->
    @api.client.logger.debug "Accounts::get called."
    route = "/accounts/#{id}"
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "Accounts::update called."
    route = "/accounts/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

  list: (id, callback) ->
    @api.client.logger.debug "Accounts::list called."
    route = "/merchants/#{id}/accounts"
    options = {}
    @api.request(route, options, callback)

  delete: (id, callback) ->
    @api.client.logger.debug "Accounts::delete called."
    route = "/accounts/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)

  verify: (params, callback) ->
    @api.client.logger.debug "Accounts::verify called."
    route = "/accounts/#{params.id}/verifications"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

module.exports = Accounts
