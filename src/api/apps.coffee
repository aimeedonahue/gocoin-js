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

  get: (id, callback) ->
    @api.client.logger.debug "Apps::get called."
    route = "/oauth/applications/#{id}"
    options = {}
    @api.request(route, options, callback)

  list: (id, callback) ->
    @api.client.logger.debug "Apps::list called."
    route = "/users/#{id}/applications";
    options = {}
    @api.request(route, options, callback)

  list_authorized: (id, callback) ->
    @api.client.logger.debug "Apps::list_authorized called."
    route = "/users/#{id}/authorized_applications";
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "Apps::update called."
    route = "/oauth/applications/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

  new_secret: (id, callback) ->
    @api.client.logger.debug "Apps::new_secret called."
    route = "/oauth/applications/#{id}/request_new_secret"
    options = 
      method: 'POST'
    @api.request(route, options, callback)

  get_by_uid: (uid, callback) ->
    @api.client.logger.debug "Apps::get_by_uid called."
    route = "/oauth/applications/uid/#{uid}"
    config =
      host: @api.client.options.host
      path: "#{@api.client.options.path}/#{@api.client.options.api_version}#{route}"
      method: 'GET'
      port: @api.client.port()
      headers: @api.client.headers

    @api.client.raw_request(config, callback)

module.exports = Apps
