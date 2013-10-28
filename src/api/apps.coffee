# GoCoin Third Party Applications
#
class Apps

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "Apps::create called."
    route = '/oauth/applications'
    options = 
      method: 'POST'
      body: params
    @api.request(route, options, callback)

  create_code: (params, callback) ->
    @api.client.logger.debug "Apps::create_code called."
    route = '/oauth/authorize'
    options =
      method: 'POST'
      body: params
    @api.request(route, options, callback)

  delete: (id, callback) ->
    @api.client.logger.debug "Apps::delete called."
    route = "/oauth/applications/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)

  delete_authorized: (id, callback) ->
    @api.client.logger.debug "Apps::delete_authorized called."
    route = "/oauth/authorized_applications/#{id}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)

  ### No need for this method yet
  get: (id, callback) ->
    @api.client.logger.debug "Apps::get called."
    
    @api.request(route, options, callback)
  ###

  list: (id, callback) ->
    @api.client.logger.debug "Apps::list called."
    route = "/users/#{id}/applications";
    options = {}
    @api.request(route, options, callback)

  list_authorized: (callback) ->
    @api.client.logger.debug "Apps::list_authorized called."
    route = '/oauth/authorized_applications';
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "Apps::update called."
    route = "/oauth/applications/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

module.exports = Apps
