Merchant = require './api/merchant'
User     = require './api/user'

# The API interface for working with GoCoin resources.
#
class Api

  constructor: (@client) ->
    console.log "Api::constructor called."
    @user = new User(@)
    @merchant = new Merchant(@)

  request: () ->
    # Do stuff.
    console.log "Api::request called."
    @client.raw_request()

module.exports = Api
