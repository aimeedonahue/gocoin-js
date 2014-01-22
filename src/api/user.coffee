# GoCoin User
#
class User

  constructor: (@api) ->

  get: (id, callback) ->
    @api.client.logger.debug "User::get called."
    route = "/users/#{id}"
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "User::update called."
    route = "/users/#{params.id}"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)
    
  self: (callback) ->
    @api.client.logger.debug "User::self called."
    route = '/user'
    options = {}
    @api.request(route, options, callback)

  update_password: (params, callback) ->
    @api.client.logger.debug "User::update_password called."
    route = "/users/#{params.id}/password"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)
    
module.exports = User
