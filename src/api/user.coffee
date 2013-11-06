# GoCoin User
#
class User

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "User::create called."
    route = '/users';
    options = 
      body: user_data
    @api.request(route, options, callback)

  delete: (id, callback) ->
    @api.client.logger.debug "User::delete called."
    route = "/users/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)
    
  get: (id, callback) ->
    @api.client.logger.debug "User::get called."
    route = "/users/#{id}"
    options = {}
    @api.request(route, options, callback)

  list: (callback) ->
    @api.client.logger.debug "User::list called."
    route = '/users';
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

  #These requests do not require a login (token) and therefore use @client.raw_request
  request_password_reset: (params, callback) ->
    @api.client.logger.debug "User::request_password_reset called."
    route = "/users/request_password_reset"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'POST'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, callback)

  request_new_confirmation_email: (params, callback) ->
    @api.client.logger.debug "User::request_new_confirmation_email called."
    route = "/users/request_new_confirmation_email"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'POST'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, callback)

  reset_password_with_token: (params, callback) ->
    @api.client.logger.debug "User::reset_password_with_token called."
    route = "/users/#{params.id}/reset_password/#{params.reset_token}"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'PATCH'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, callback)
    
module.exports = User
