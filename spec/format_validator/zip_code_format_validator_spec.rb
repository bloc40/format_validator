require_relative '../spec_helper'

describe 'ZipCodeFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :zip_code
        validates :zip_code, zip_code_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      %w[12345 12345-6789].each do |zip|
        it 'should not add any error' do
          subject.zip_code = zip
          subject.valid?.must_equal true
          subject.errors.messages.must_be_empty
        end
      end
    end

    describe 'invalid' do
      ['123', '123456', '123 45', '1234X', '12345-123', '12345-234X', '12345 6789'].each do |invalid_zip_code|
        it "should add error when zip code is #{invalid_zip_code}" do
          subject.zip_code = invalid_zip_code
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:zip_code].must_equal ['is not valid']
        end
      end
    end
  end
end
