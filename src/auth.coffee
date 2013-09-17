# Provides authorization capabilities.
#
class Auth

  constructor: (@client) ->
    console.log "Auth constructor called."

  authenticate: (options) ->
    console.log "Auth::authenticate called."
    @request()

  request: () ->
    console.log "Auth::request called."
    @client.raw_request()

module.exports = Auth
