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
    route = "/users/#{params.id}"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, @api.handler(callback))
    
  self: (callback) ->
    console.log "User::self called."
    route = '/user'
    options = {}
    @api.request(route, options, @api.handler(callback))

module.exports = User
