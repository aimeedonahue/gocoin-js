GoCoin = require '../src/gocoin'
sinon = require 'sinon'
_ = require 'underscore'


describe 'invoices', ->
  client = {}
  beforeEach () ->
  client = new GoCoin.Client
    grant_type: "improper"
    client_id: "someid"
    client_secret: "somesecret"
    username: "admin@gocoin.com"
    password: "password123"
    scope: "user_read"

    it "should contain create", ->
      client.invoices.create.should.be.a 'function'

    it "should contain get", ->
      client.invoices.get.should.be.a 'function'