# GoCoin Accounts
#
class Accounts

  constructor: (@api) ->

  list: (id, callback) ->
    @api.client.logger.debug "Accounts::list called."
    route = "/merchants/#{id}/accounts"
    options = {}
    @api.request(route, options, callback)

module.exports = Accounts
