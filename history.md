###Changelog

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

###### v0.1.0: 
Initial release: <br>
Methods for User, Merchant, and Apps