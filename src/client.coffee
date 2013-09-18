_ = require 'underscore'
http = require 'http'
https = require 'https'

Api  = require './api'
Auth = require './auth'

# A JavaScript API client for the GoCoin API.
#
class Client

  defaults:
    client_id: null
    client_secret: null
    host: 'gocoin-api.herokuapp.com'
    port: null
    path: '/api'
    api_version: 'v1'
    secure: true
    headers: {}
    grant_type: "password"
    scope: ""

  default_headers:
    'x-something-else': 'test'

  constructor: (options={}) ->
    console.log "Client::constructor called."
    @options = _.defaults options, @defaults
    console.log "Using options: #{@options}"
    @auth = new Auth(@)
    @token = @authenticate options, (res) -> console.log res
    @api = new Api(@)
    @user = @api.user
    @merchant = @api.merchant

  # Parses options to determine what kind of authentication is requested and
  # obtains an access token.
  #
  authenticate: (options, callback) ->
    console.log "Client::authenticate called."
    @auth.authenticate(options, callback)

  request_client: (secure=true) ->
    if secure then https else http

  port: (secure=true) ->
    if @options.port?
      @options.port
    else if secure
      443
    else
      80

  # Make an HTTP request to the API.
  # Config contains: host, path, port, method, headers, and body.
  #
  raw_request: (config, callback) ->
    console.log "Raw request logged."

    # Add content length.
    if config.body
      config.headers['Content-Length'] = config.body.length

    console.log "Making request with config: ", config
    request = @request_client().request(config, callback)
    request.on 'error', (err) ->
      # log the error
      callback(err)
    if config.body
      request.write config.body
    request.end


module.exports = Client
