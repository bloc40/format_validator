module ActiveModel
  module Validations
    class UrlFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        unless value =~ /\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\Z/i
          object.errors[attribute] << (options[:message] || 'is not valid')
        end
      end
    end
  end
end
