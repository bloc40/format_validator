module ActiveModel
  module Validations
    class ZipCodeFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /^\d{5}(-\d{4})?$/
          object.errors[attribute] << (options[:message] || 'is not valid')
        end
      end
    end
  end
end
