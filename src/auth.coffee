_ = require 'underscore'

# Provides authorization capabilities.
#
class Auth

  constructor: (@client) ->
    console.log "Auth constructor called."

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
  authenticate: (options, callback) ->
    console.log "Auth::authenticate called."
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

    console.log "Required params: #{required}"
    body = JSON.stringify @build_body(options, required)

    #Configure Request
    config =
      host: options.host
      path: "/oauth/token"
      method: "POST"
      port: @client.port()
      headers: headers
      body: body

    @client.raw_request(config, callback)


  # Validates that required options are included and returns a body.
  #
  build_body: (options, required) ->
    _.reduce required, ((m, k) ->
      throw new Error "Authenticate requires '#{k}' option." unless options[k]
      m[k] = options[k]
      return m
    ), {}


module.exports = Auth
