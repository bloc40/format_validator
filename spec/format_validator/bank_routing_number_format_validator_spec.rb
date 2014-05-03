require_relative '../spec_helper'

describe 'BankRoutingNumberFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :bank_routing_number
        validates :bank_routing_number, bank_routing_number_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      it 'is valid when the number is 9 digits' do
        subject.bank_routing_number = 123456789
        subject.valid?.must_equal true
        subject.errors.messages.must_be_empty
      end
    end

    describe 'invalid' do
      ['12345678', '1234567xx', '123 45 6789', '123', '1234567890'].each do |invalid_bank_routing_number|
        it "adds error when the number is #{invalid_bank_routing_number}" do
          subject.bank_routing_number = invalid_bank_routing_number
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:bank_routing_number].must_equal ['is invalid']
        end
      end
    end
  end
end
