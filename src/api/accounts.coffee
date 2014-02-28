# GoCoin Accounts
#
querystring = require 'querystring'

class Accounts

  constructor: (@api) ->

  list: (id, callback) ->
    @api.client.logger.debug "Accounts::list called."
    route = "/merchants/#{id}/accounts"
    options = {}
    @api.request(route, options, callback)

  get_transactions: (params, callback) ->
    @api.client.logger.debug "Accounts::get_transactions called"
    data = querystring.stringify params.data
    route = "/accounts/#{params.id}/transactions?#{data}"
    options = {}
    @api.request(route, options, callback)

module.exports = Accounts
