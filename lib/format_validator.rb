require 'format_validator/version'
require 'format_validator/email_format_validator'
require 'format_validator/url_format_validator'
require 'format_validator/hostname_format_validator'
require 'format_validator/zip_code_format_validator'
require 'format_validator/future_date_validator'
require 'format_validator/ssn_format_validator'
require 'format_validator/company_tax_id_format_validator'

module FormatValidator
  I18n.load_path << File.expand_path('../locales/en.yml', __FILE__)
end
