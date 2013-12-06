Xrate = require '../src/xrate'
sinon = require 'sinon'
_ = require 'underscore'

describe 'Xrate', ->
  describe 'constructor', ->
    it 'should throw an error if option.xrate_host is not provided', () ->
      (
        () ->
          xrate = new Xrate {}
        ).should.throw 'Requires options.xrate_host'
    it 'should throw an error if options is not an object', () ->
      (
        () ->
          xrate = new Xrate 'hi'
        ).should.throw 'Requires options.xrate_host'

  describe 'get', ->
    it 'should throw an error if option.xrate_host is not provided', () ->
      (
        () ->
          xrate = new Xrate xrate_host: 'dummy_url'
          xrate.get()
        ).should.throw 'Xrate: Callback is not defined'
