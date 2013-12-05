_ = require 'underscore'
querystring  = require 'querystring'

# Provides authorization capabilities.
#
class Auth

  constructor: (@client) ->

  required_password_params: ['grant_type', 'client_id', 'client_secret',
                              'username', 'password', 'scope']
  required_code_params: ['grant_type', 'client_id', 'client_secret',
                            'code', 'redirect_uri']

  # Gets a user token.
  # Options:
  #   grant_type
  #   client_id
  #   client_secret
  #   username
  #   password
  #   scope
  #
  authenticate: (options, callback) =>
    @client.logger.debug "Auth::authenticate called."
    if _.isFunction(options)
      callback = options
      options = {}
    throw new Error 'Authenticate: callback was not defined' unless callback? 
    headers = if options.headers? then _.defaults(options.headers, @client.headers) else _.defaults {}, @client.headers
    options = _.defaults options, @client.options

    required = switch options.grant_type
      when 'password' then @required_password_params
      when 'authorization_code' then @required_code_params
      else throw new Error 'Authenticate: grant_type was not defined properly'

    @client.logger.debug "Required params: #{required}"
    body = JSON.stringify @build_body(options, required)

    #Configure Request
    config =
      host: options.host
      path: "#{options.path}/#{options.api_version}/oauth/token"
      method: "POST"
      port: @client.port(options.secure)
      headers: headers
      body: body

    @client.raw_request config, callback


  # Validates that required options are included and returns a body.
  #
  build_body: (options, required) ->
    _.reduce required, ((m, k) ->
      throw new Error "Authenticate requires '#{k}' option." unless options[k]
      m[k] = options[k]
      return m
    ), {}

  construct_code_url: (params) ->
    ###
    example params object
    params = 
      response_type: 'code'
      client_id: CLIENT_ID
      redirect_uri: REDIRECT_URL
      scope: SCOPE
      state: STATE (optional)
    ###
    safe_params = querystring.stringify params
    route = "https://#{@client.options.dash_url}/auth?#{safe_params}" 


module.exports = Auth
