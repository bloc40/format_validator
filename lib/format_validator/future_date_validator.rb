module ActiveModel
  module Validations
    class FutureDateValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        if value.to_i <= Time.now.to_i
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.date'))
        end
      end
    end
  end
end
