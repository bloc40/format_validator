require_relative '../spec_helper'

describe 'SsnFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :ssn
        validates :ssn, ssn_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      it 'should not add any error' do
        subject.ssn = '123-45-6789'
        subject.valid?.must_equal true
        subject.errors.messages.must_be_empty
      end
    end

    describe 'invalid' do
      ['123456789', '123 45 6789', '123', '1234567890'].each do |invalid_ssn|
        it "should add error when ssn is #{invalid_ssn}" do
          subject.ssn = invalid_ssn
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:ssn].must_equal ['is invalid']
        end
      end
    end
  end
end
