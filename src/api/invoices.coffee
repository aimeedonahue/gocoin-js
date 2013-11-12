# GoCoin Invoices
#
_           = require 'underscore'
querystring = require 'querystring'

class Invoices

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "Invoices::create called."
    route = "/merchants/#{params.id}/invoices"
    options = 
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (id, callback) ->
    @api.client.logger.debug "Invoices::get called."
    route = "/invoices/#{id}"
    options = {}
    @api.request(route, options, callback)

  search: (params, callback) ->
    @api.client.logger.debug "Invoices::search called"
    params = querystring.stringify params
    route = "/invoices/search?#{params}"
    options = {}
    @api.request(route, options, callback)

  update: (params, callback) ->
    @api.client.logger.debug "Invoices::get called."
    route = "/invoices/#{params.id}"
    options = 
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)

module.exports = Invoices
