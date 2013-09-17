# GoCoin Merchant
#
class Merchant

  constructor: (@api) ->
    console.log "Merchant::constructor called."

  create: () ->
    console.log "Merchant::create called."
    @api.request()

  delete: () ->
    console.log "Merchant::delete called."
    @api.request()

  get: () ->
    console.log "Merchant::get called."
    @api.request()

  list: () ->
    console.log "Merchant::list called."
    @api.request()

  update: () ->
    console.log "Merchant::update called."
    @api.request()

module.exports = Merchant
