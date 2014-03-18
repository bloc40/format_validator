module ActiveModel
  module Validations
    class SsnFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\A\d{3}-\d{2}-\d{4}\z/
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.ssn'))
        end
      end
    end
  end
end
