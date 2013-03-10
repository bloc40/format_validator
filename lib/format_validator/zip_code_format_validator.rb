module ActiveModel
  module Validations
    class ZipCodeFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /^\d{5}(-\d{4})?$/
          object.errors[attribute] << (options[:message] || 'is not a valid zip code')
        end
      end
    end
  end
end
