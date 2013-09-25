GoCoin = require '../src/gocoin'
sinon = require 'sinon'
_ = require 'underscore'

describe 'GoCoin', ->

  it 'should be an object', ->
    GoCoin.should.be.a 'object'

  it "should contain Api", ->
    GoCoin.Api.should.be.a 'function'

  it "should contain Auth", ->
    GoCoin.Auth.should.be.a 'function'

  it "should contain Client", ->
    GoCoin.Client.should.be.a 'function'

  


