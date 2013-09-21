# GoCoin User
#
class User

  constructor: (@api) ->
    console.log "User::constructor called."

  create: (user_data, callback) ->
    console.log "User::create called."
    route = '/api/v1/users';
    options = 
      body: user_data
    @api.request(route, options, @api.handler(callback))

  delete: (id, callback) ->
    console.log "User::delete called."
    route = "/api/v1/users/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, @api.handler(callback))
    
  get: (id, callback) ->
    console.log "User::get called."
    route = "/api/v1/users/#{id}"
    options = {}
    @api.request(route, options, @api.handler(callback))

  list: (callback) ->
    console.log "User::list called."
    route = '/api/v1/users';
    options = {}
    @api.request(route, options, @api.handler(callback))
    
  update: (opts, callback) ->
    console.log "User::update called."
    route = "/api/v1/users/#{opts.id}"
    options =
      method: 'PATCH'
      body: opts.data
    @api.request(route, options, @api.handler(callback))
    
  self: (callback) ->
    console.log "User::self called."
    route = '/user'
    options = {}
    @api.request(route, options, @api.handler(callback))

module.exports = User
