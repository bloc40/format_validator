require 'format_validator/version'
require 'format_validator/email_format_validator'
require 'format_validator/url_format_validator'
require 'format_validator/zip_code_format_validator'
require 'format_validator/future_date_validator'

module FormatValidator
  I18n.load_path << File.expand_path('../format_validator/locale/en.yml', __FILE__)
end
