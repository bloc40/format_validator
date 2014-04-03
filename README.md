# FormatValidator

[![Build Status](https://travis-ci.org/bloc40/format_validator.png?branch=master)](https://travis-ci.org/bloc40/format_validator) [![Code Climate](https://codeclimate.com/github/bloc40/format_validator.png)](https://codeclimate.com/github/bloc40/format_validator)

## Installation

Add this line to your application's Gemfile:

    gem 'format_validator'

And then execute:

    $ bundle

## Usage

``` ruby
validates :email, email_format: true
validates :url, url_format: true
validates :hostname, hostname_format: true
validates :zip_code, zip_code_format: true
validates :zip_code, zip_code_short_format: true
validates :expiration_date, future_date: true
validates :ssn, ssn_format: true
validates :tax_id, company_tax_id_format: true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
