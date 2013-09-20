# GoCoin User
#
class User

  constructor: (@api) ->
    console.log "User::constructor called."

  create: () ->
    console.log "User::create called."
    @api.request()

  delete: () ->
    console.log "User::delete called."
    @api.request()

  get: () ->
    console.log "User::get called."
    @api.request()

  list: () ->
    console.log "User::list called."
    @api.request()

  update: () ->
    console.log "User::update called."
    @api.request()

  self: (callback) ->
    console.log "User::self called."
    route = '/user'
    options = {}
    @api.request(route, options, @api.handler(callback))

module.exports = User
