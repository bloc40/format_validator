module ActiveModel
  module Validations
    class CompanyTaxIdFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\A\d{2}-?\d{7}\z/
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.ssn'))
        end
      end
    end
  end
end
