module ActiveModel
  module Validations
    class HostnameFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\A([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\z/i
          object.errors[attribute] << (options[:message] || I18n.t('form.errors.hostname'))
        end
      end
    end
  end
end
