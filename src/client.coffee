_ = require 'underscore'

Api  = require './api'
Auth = require './auth'

# A JavaScript API client for the GoCoin API.
#
class Client

  defaults:
    client_key: null
    client_secret: null
    host: 'gocoin-api.herokuapp.com'
    port: 80
    path: '/api'
    api_version: '/v1'
    secure: true
    headers: {}

  default_headers:
    'x-something-else': 'test'

  constructor: (options={}) ->
    console.log "Client::constructor called."
    #@options = _.defaults options, defaults
    @auth = new Auth(@)
    @token = @authenticate(options)
    @api = new Api(@)
    @user = @api.user
    @merchant = @api.merchant

  # Parses options to determine what kind of authentication is requested and
  # obtains an access token.
  #
  authenticate: (options) ->
    console.log "Client::authenticate called."
    @auth.authenticate(options)

  # Make an HTTP request to the API.
  #
  raw_request: () ->
    console.log "Raw request logged."

module.exports = Client
