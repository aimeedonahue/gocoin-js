###Changelog

#### v0.3.4
Adds Currency Conversion and Payout Classes

#### v0.3.2
Adds Invoice::Webhook for testing callback urls

#### v0.3.0
Strip out methods into admin module

#### v0.2.16
Same as v0.2.14 - repairs deployment error

#### v0.2.14
Public release with refactored route to update merchantpayoutaddresses

#### v0.2.12
Public release of v0.2.11

#### v0.2.11
Add Merchantpayoutaddresses class

#### v0.2.10
Public release for forcing https in xrate class

#### v0.2.8
Public release of v0.2.7

#### v0.2.7
add Xrate class - pull xrate from x.g0cn.com

#### v0.2.6
Public release of v0.2.5

#### v0.2.5
Add apps::get_by_uid route

#### v0.2.3
Add MerchantUsers class

#### v0.2.2
Public Release: Same as v0.2.0 - repush due to npm error

#### v0.2.0
Public Release: Breaking Change - repository location

###### v0.1.18
Public release: options.secure = "false" results in options.secure = false (bool)

###### v0.1.16
Public release: insecure requests default to port 80 rather than being set manually

###### v0.1.14
Public release: Minor update to user update route

###### v0.1.12
Public release of v0.1.11

###### v0.1.11
Update to apps::list_authorized route

###### v0.1.10
Public release of 0.1.9

###### v0.1.9
Update api url for production
Correct accounts::list to require a merchant_id(id)
Integrated winston and introduced dependency, Custom winston loggers can now be injected using options.logger
Introduce dependency to underscore
New method invoices::new_secret - request a new secret key and invalidate existing tokens. 

###### v0.1.8
Public release of account methods

###### v0.1.7
Added accounts methods

###### v0.1.6:
Public release of callback change

###### v0.1.5:
Altered callback structure to format (err, body)

###### v0.1.4:
Public release with invoice methods

###### v0.1.3:
Add password methods to @api.user <br>
Correct versioning (odd numbers for dev releases)

###### v0.1.1:
Corrected prepublish script for npm

#### v0.1.0: 
Initial release: <br>
Methods for User, Merchant, and Apps