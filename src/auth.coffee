_ = require 'underscore'

# Provides authorization capabilities.
#
class Auth

  constructor: (@client) ->
    console.log "Auth constructor called."

  required_password_params: ['grant_type', 'client_id', 'client_secret',
                              'username', 'password']
  required_client_params: ['grant_type', 'client_id', 'client_secret',
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

    options = _.defaults options, @client.options
    console.log options
    required = switch options.grant_type
      when 'password' then @required_password_params
      when 'client_credentials' then @required_client_params

    console.log "Required params: #{required}"
    body = JSON.stringify @build_body(options, required)

    # Validation
    config =
      path: "/oauth/token"
      method: "POST"
      headers: { 'Content-Type': 'application/json' }
      body: body

    @client.raw_request(config, callback)


  # Validates that required options are included and returns a body.
  #
  build_body: (options, required) ->
    _.reduce required, ((m, k) ->
      console.log "Checking param: #{k}"
      throw new Error "Authenticate requires '#{k}' option." unless options[k]
      m[k] = options[k]
      return m
    ), {}


module.exports = Auth
