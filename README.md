gocoin-js
===========

A JavaScript client library for the GoCoin API. It is written in CoffeeScript
and is ready for use in both modern browsers and Node.js servers.

#### NOTICE:
This code is highly experimental. If you are interested in Gocoin, please contact kevin@gocoin.com

## Usage

```js
var GoCoin = require('gocoin');
var client = new GoCoin.Client({
  client_id: '...',
  client_secret: '...',
  ...
});
client.authenticate({options}, function (response, data) {
  client.set_token(data.access_token)

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


### Apps

##### apps.create(params, callback)
##### apps.create_code(params, callback)
##### apps.delete(id, callback)
##### apps.delete_authorized(id, callback)
##### apps.list(callback)
##### apps.list_authorized(callback)
##### apps.update(params, callback)


### License

Copyright 2013 GoCoin Pte. Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.