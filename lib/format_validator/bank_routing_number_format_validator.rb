module ActiveModel
  module Validations
    class BankRoutingNumberFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value.to_s.match /\A\d{9}\z/
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.bank_routing_number'))
        end
      end
    end
  end
end
