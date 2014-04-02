GoCoin = require '../src/gocoin'
sinon = require 'sinon'
_ = require 'underscore'

describe 'GoCoin', ->

  it "should contain Api", ->
    GoCoin.should.have.property('Api')

  it "should contain Auth", ->
    GoCoin.should.have.property('Auth')

  it "should contain Client", ->
    GoCoin.should.have.property('Client')

  


