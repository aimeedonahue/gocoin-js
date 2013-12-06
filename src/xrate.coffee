# GoCoin Xrate
#
_    = require 'underscore'
http = require 'http'

class Xrate

  constructor: (@options) ->
    throw new Error 'Requires options.xrate_host' unless _.isObject(options) && options.xrate_host?

  get: (callback) ->
    @options.logger.debug "Xrate::get called." if @options.logger
    throw new Error 'Xrate: Callback is not defined' unless callback? && _.isFunction(callback)  
    config =
      host: @options.xrate_host
      path: "/prices"
      method: 'GET'
      port: 80
    @simple_raw_request config, callback

  simple_raw_request: (config, callback) ->
    @options.logger.debug "Raw request made", (config) if @options.logger
    request = http.request config, (response) =>
      response_data = ''
      response.on 'data', (chunk) ->
        response_data += chunk
      response.on 'end', () =>
        if response.statusCode >= 400
          callback { status: response.statusCode }
        else  
          callback null, response_data
    request.on 'error', (err) ->
      # log the error
      callback err
    request.end()

module.exports = Xrate
