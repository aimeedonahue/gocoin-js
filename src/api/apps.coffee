# GoCoin Third Party Applications
#
class Apps

  constructor: (@api) ->
    console.log "Apps::constructor called."

  create: (params, callback) ->
    console.log "Apps::create called."
    route = '/oauth/applications'
    options = 
      method: 'POST'
      body: params
    @api.request(route, options, @api.handler(callback))

  create_code: (params, callback) ->
    console.log "Apps::create_code called."
    route = '/oauth/authorize'
    options =
      method: 'POST'
      body: params
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

  update: (params, callback) ->
    console.log "Apps::update called."
    route = "/oauth/applications/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, @api.handler(callback))

module.exports = Apps
