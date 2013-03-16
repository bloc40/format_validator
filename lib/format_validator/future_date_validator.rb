module ActiveModel
  module Validations
    class FutureDateValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        if value.to_i <= Time.now.to_i
          object.errors[attribute] << (options[:message] || 'must be in the future')
        end
      end
    end
  end
end
