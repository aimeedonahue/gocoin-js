# GoCoin Third Party Applications
#
class Apps

  constructor: (@api) ->
    console.log "Apps::constructor called."

  create: (app_data, callback) ->
    console.log "Apps::create called."
    route = '/oauth/applications'
    options = 
      method: 'POST'
      body: app_data
    @api.request(route, options, @api.handler(callback))

  create_code: (auth_data, callback) ->
    console.log "Apps::create_code called."
    route = '/oauth/authorize'
    options =
      method: 'POST'
      body: auth_data
    @api.request(route, options, @api.handler(callback))

  delete: (id, callback) ->
    console.log "Apps::delete called."
    route = "/oauth/applications/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, @api.handler(callback))

  delete_authorized: (id, callback) ->
    console.log "Apps::delete_authorized called."
    route = "/oauth/authorized_applications/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, @api.handler(callback))

  ### No need for this method yet
  get: (id, callback) ->
    console.log "Apps::get called."
    
    @api.request(route, options, @api.handler(callback))
  ###

  list: (callback) ->
    console.log "Apps::list called."
    route = '/oauth/applications';
    options = {}
    @api.request(route, options, @api.handler(callback))

  list_authorized: (callback) ->
    console.log "Apps::list_authorized called."
    route = '/oauth/authorized_applications';
    options = {}
    @api.request(route, options, @api.handler(callback))

  update: (opts, callback) ->
    console.log "Apps::update called."
    route = "/oauth/applications/#{opts.id}"
    options = 
      method: 'PATCH'
      body: opts.data
    @api.request(route, options, @api.handler(callback))

module.exports = Apps
