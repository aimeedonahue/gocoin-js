gocoin-js
===========

A JavaScript client library for the GoCoin API. It is written in CoffeeScript
and is ready for use in both modern browsers and Node.js servers.


## Usage

```js
var GoCoin = require('gocoin');
var client = new GoCoin.Client({
  client_id: '...',
  client_secret: '...',
  ...
});

client.user.create({...}, function(){
  console.log("User created.");
});
```

## Methods

### Users

##### user.self(callback)
##### user.list(callback)
##### user.create(params, callback)
##### user.delete(id, callback)
##### user.get(id, callback)
##### user.update(params, callback)


### Merchants

##### merchant.list(callback)
##### merchant.create(params, callback)
##### merchant.delete(id, callback)
##### merchant.get(id, callback)
##### merchant.update(params, callback)
