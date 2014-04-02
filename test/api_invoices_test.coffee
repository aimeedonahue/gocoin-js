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
      client.invoices.should.have.property('create')

    it "should contain get", ->
      client.invoices.should.have.property('get')
