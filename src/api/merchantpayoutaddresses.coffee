# GoCoin Merchantpayoutaddresses
#
class Merchantpayoutaddresses

  constructor: (@api) ->

  create: (params, callback) ->
    @api.client.logger.debug "MerchantPayoutAddresses::create called."
    route = "/merchants/#{params.mid}/payout_addresses"
    options =
      method: 'POST'
      body: params.data
    @api.request(route, options, callback)

  get: (params, callback) ->
    @api.client.logger.debug "MerchantPayoutAddresses::get called."
    route = "/merchants/#{params.mid}/payout_addresses?currency_code=#{params.curr_code}"
    options = {}
    @api.request(route, options, callback)

  getactive: (params, callback) ->
    @api.client.logger.debug "MerchantPayoutAddresses::getactive called."
    route = "/merchants/#{params.mid}/payout_addresses/active/#{params.data.currency_code}"
    options = {}
    @api.request(route, options, callback)

  setactive: (params, callback) ->
    @api.client.logger.debug "MerchantPayoutAddresses::setactive called."
    route = "/merchants/#{params.mid}/payout_addresses/set_active"
    options =
      method: 'PATCH'
      body: params.data
    @api.request(route, options, callback)


module.exports = Merchantpayoutaddresses
