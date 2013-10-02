# GoCoin User
#
class User

  constructor: (@api) ->
    console.log "User::constructor called."

  create: (params, callback) ->
    console.log "User::create called."
    route = '/users';
    options = 
      body: user_data
    @api.request(route, options, @api.handler(callback))

  delete: (id, callback) ->
    console.log "User::delete called."
    route = "/users/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, @api.handler(callback))
    
  get: (id, callback) ->
    console.log "User::get called."
    route = "/users/#{id}"
    options = {}
    @api.request(route, options, @api.handler(callback))

  list: (callback) ->
    console.log "User::list called."
    route = '/users';
    options = {}
    @api.request(route, options, @api.handler(callback))
    
  update: (params, callback) ->
    console.log "User::update called."
    route = "/users/#{params.id}/password"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, @api.handler(callback))
    
  self: (callback) ->
    console.log "User::self called."
    route = '/user'
    options = {}
    @api.request(route, options, @api.handler(callback))

  update_password: (params, callback) ->
    console.log "User::update_password called."
    route = "/users/#{params.id}/password"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, @api.handler(callback))

  #These requests do not require a login (token) and therefore use @client.raw_request
  request_password_reset: (params, callback) ->
    console.log "User::request_password_reset called."
    route = "/users/request_password_reset"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'POST'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, @api.handler(callback))

  request_new_confirmation_email: (params, callback) ->
    console.log "User::request_new_confirmation_email called."
    route = "/users/request_new_confirmation_email"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'POST'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, @api.handler(callback))

  reset_password_with_token: (params, callback) ->
    console.log "User::reset_password_with_token called."
    route = "/users/#{params.id}/reset_password/#{params.reset_token}"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'PATCH'
      port: @api.client.port()
      headers: @api.client.headers
      body: JSON.stringify params.data

    @api.client.raw_request(config, @api.handler(callback))
    
module.exports = User
