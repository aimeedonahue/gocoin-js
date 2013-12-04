# GoCoin Merchantusers
#
class Merchantusers

  constructor: (@api) ->

  delete: (params, callback) ->
    @api.client.logger.debug "MerchantUser::delete called."
    route = "/merchants/#{params.mid}/users/#{params.uid}"
    options = 
      method: 'DELETE'
    @api.request(route, options, callback)

  get: (id, callback) ->
    @api.client.logger.debug "MerchantUsers::get called."
    route = "/merchants/#{id}/users"
    options = {}
    @api.request(route, options, callback)

  add: (params, callback) ->
    @api.client.logger.debug "MerchantUsers::put called."
    route = "/merchants/#{params.mid}/users/#{params.uid}"
    options =
      method: 'PUT'
    @api.request(route, options, callback)

module.exports = Merchantusers
