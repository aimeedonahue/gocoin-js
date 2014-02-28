require './log'
_        = require 'underscore'
http     = require 'http'
https    = require 'https'
winston  = require 'winston'

Api  = require './api'
Auth = require './auth'
Xrate = require './xrate'

# A JavaScript API client for the GoCoin API.
#
class Client

  defaults:
    logger: winston.loggers.get 'gocoin-js'
    client_id: null
    client_secret: null
    host: 'api.gocoin.com'
    port: null
    path: '/api'
    api_version: 'v1'
    secure: true
    method: 'GET'
    headers: null
    request_id: null
    dash_host: "dashboard.gocoin.com"
    xrate_host: "x.g0cn.com"

  default_headers:
    'Content-Type': 'application/json'

  constructor: (options={}) ->
    @options = _.defaults options, @defaults
    @logger = @options.logger
    @headers = if options.headers? then options.headers else _.defaults {}, @default_headers
    if @options.request_id? then @headers['X-Request-Id'] = @options.request_id
    
    if @options.secure == "false" 
      @options.secure = false

    @auth = new Auth(@)
    @xrate = new Xrate(@options)

    @add_extensions()

  add_extensions: () ->
    @api = new Api(@)

    @user = @api.user
    @merchant = @api.merchant
    @invoices = @api.invoices
    @accounts = @api.accounts
    @merchantpayoutaddresses = @api.merchantpayoutaddresses
    @currency_conversions = @api.currency_conversions
    @payouts = @api.payouts

  set_token: (@token) ->
  get_token: () ->
    @token 
  # Parses options to determine what kind of authentication is requested and
  # obtains an access token.
  #
  authenticate: (options, callback) ->
    @logger.debug "Client::authenticate called."
    if _.isFunction(options)
      callback = options
      options = {}
      
    @auth.authenticate options, callback

  request_client: (secure=true) ->
    if secure then https else http

  port: (secure=true) ->
    if @options.port?
      @options.port
    else if secure
      443
    else
      80

  strip_secure_from_raw: (obj) ->
    strippable = ['client_secret', 'password']
    if obj.body?
      obj.body = JSON.parse obj.body
      _.each strippable, (k) ->
        if obj.body[k]? then obj.body[k] = "<#{k}>"
    if obj.headers.Authorization? then obj.headers.Authorization = '<bearer>'
    return obj

  # Make an HTTP request to the API.
  # Config contains: host, path, port, method, headers, and body.
  #
  raw_request: (config, callback) ->
    # Add content length.
    if config.body
      config.headers['Content-Length'] = config.body.length

    log_config = _.clone config
    log_config.headers = _.clone config.headers
    @logger.debug "Raw request made", @strip_secure_from_raw(log_config)

    request = @request_client(@options.secure).request config, (response) =>
      response_data = ''
      response.on 'data', (chunk) ->
        response_data += chunk
      response.on 'end', () =>
        if response.statusCode >= 400
          @response_error response, response_data, callback
        else if response.statusCode >= 300
          callback null, response.headers.location
        else  
          callback null, response_data

    request.on 'error', (err) ->
      # log the error
      callback err

    if config.body
      request.write config.body

    request.end()

  response_error: (response, body, callback) ->
    try
      json_body = JSON.parse body
      error = 
        message: json_body
        status: response.statusCode

    catch e
      error =
        status: response.statusCode
        
    callback error


module.exports = Client
