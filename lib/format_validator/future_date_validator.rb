module ActiveModel
  module Validations
    class FutureDateValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        if value <= Time.now
          object.errors[attribute] << (options[:message] || 'must be in the future')
        end
      end
    end
  end
end
