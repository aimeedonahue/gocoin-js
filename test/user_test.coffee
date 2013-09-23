GoCoin = require '../src/gocoin'
sinon = require 'sinon'
_ = require 'underscore'

validate_method = (args) ->
  console.log 'checking method config'

  req_get = ['host', 'path', 'method', 'port', 'headers']
  req_else = ['host', 'path', 'method', 'port', 'headers', 'body']

  required = switch args.method
    when 'GET' then required = req_get
    when 'DELETE' then required = req_get
    else required = req_else

  _.map required, (k) ->
    console.log("#{k}: #{args[k]}")
    throw new Error "method requires '#{k}' in config." unless args[k]

validate_headers = (args) ->
  console.log 'checking headers'
  
  req_api_get = ['Content-Type', 'Authorization']
  req_api_else = ['Content-Type', 'Authorization', 'Content-Length']

  required = switch args.method
    when 'GET' then required = req_api_get
    when 'DELETE' then required = req_api_get
    else required = req_api_else

  _.map required, (k) ->
    console.log("#{k}: #{args.headers[k]}")
    throw new Error "method requires header '#{k}'" unless args.headers[k]

describe 'user', ->
  client = {}
  beforeEach () ->
  client = new GoCoin.Client
    grant_type: "improper"
    client_id: "someid"
    client_secret: "somesecret"
    username: "admin@gocoin.com"
    password: "password123"
    scope: "user_read"
    
  describe 'self', ->
    it "should make a valid request", () ->
      (
        stub = sinon.stub(client, "raw_request")
        () ->
          client.set_token('sometokenstring')
          client.user.self ->

          request_config = stub.args[0][0]
          request_callback = stub.args[0][1]

          request_config.should.be.a 'object'
          request_callback.should.be.a 'function'


          validate_method stub.args[0][0]
          validate_headers stub.args[0][0]

        )()