require_relative '../spec_helper'

describe 'CompanyTaxIdFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :tax_id
        validates :tax_id, company_tax_id_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      ['123456789', '12-3456789'].each do |number|
        it "should not add any error when the tax id is #{number}" do
          subject.tax_id = number
          subject.valid?.must_equal true
          subject.errors.messages.must_be_empty
        end
      end
    end

    describe 'invalid' do
      ['123-456789', '1234567xx', '123 45 6789', '123', '1234567890'].each do |invalid_ssn|
        it "should add error when ssn is #{invalid_ssn}" do
          subject.tax_id = invalid_ssn
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:tax_id].must_equal ['is invalid']
        end
      end
    end
  end
end
