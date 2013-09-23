GoCoin = require '../src/gocoin'
sinon = require 'sinon'
_ = require 'underscore'

describe 'Client', ->
    client = {}
    beforeEach () ->
      client = new GoCoin.Client
        grant_type: "improper"
        client_id: "someid"
        client_secret: "somesecret"
        username: "admin@gocoin.com"
        password: "password123"
        scope: "user_read" 

    describe 'auth', ->
      describe 'authenticate', ->
        it "should throw an error if callback is not defined", () ->
          client.auth.authenticate.should.throw 'Authenticate: callback was not defined' 

        it "should throw an error if an improper grant_type is specified", () ->
          (
            () ->
              client.auth.authenticate {}, ->
            ).should.throw 'Authenticate: grant_type was not defined properly'

        it "should throw an error if missing required properties for password grant_type", () ->
         ( #instantiated without client_id
            () ->
              client = new GoCoin.Client
                grant_type: "password"
                client_secret: "somesecret"
                username: "admin@gocoin.com"
                password: "password123"
                scope: "user_read" 
              client.auth.authenticate {}, ->
            ).should.throw "Authenticate requires 'client_id' option."

        it "should throw an error if missing required properties for authorization_code grant_type", () ->
          ( #instantiated without code
            () ->
              client = new GoCoin.Client
                grant_type: "authorization_code"
                client_id: "someid"
                client_secret: "somesecret"
                redirect_uri: "someuri"
              client.auth.authenticate {}, ->
            ).should.throw "Authenticate requires 'code' option."

    describe 'api', ->
      describe 'request', ->
        it "should throw an error if route is undefined", () ->
          (
            () ->
              client.api.request()
            ).should.throw 'Api Request: Route was not defined' 

        it "should throw an error if options is not and object", () ->
          (
            () ->
              client.api.request '/somewhere', 'stringnotobject' , ->
            ).should.throw 'Api Request: Options is not an object' 

        it "should not throw an error if options is undefined", () ->
          (
            () ->
              client.api.request '/somewhere',  ->
            ).should.not.throw 

        it "should throw an error if callback is undefined", () ->
          (
            () ->
              client.api.request '/somewhere', {}
            ).should.throw 'Api Request: Callback is not defined'

        it "should throw an error if token is undefined", () ->
          (
            () ->
              client.api.request '/somewhere', {}, ->
            ).should.throw 'Api not ready: Token was not defined' 
    

