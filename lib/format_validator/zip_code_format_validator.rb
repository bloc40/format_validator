module ActiveModel
  module Validations
    class ZipCodeFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /^\d{5}(-\d{4})?$/
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.zip_code'))
        end
      end
    end

    class ZipCodeShortFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\A\d{5}\z/
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.zip_code'))
        end
      end
    end
  end
end
