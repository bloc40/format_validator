module ActiveModel
  module Validations
    class EmailFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.email'))
        end
      end
    end
  end
end
