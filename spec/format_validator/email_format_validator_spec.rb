require_relative '../spec_helper'

describe 'EmailFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        attr_accessor :email
        include ActiveModel::Validations
        validates :email, email_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      it 'should not add any error' do
        subject.email = 'foo@bar.com'
        subject.valid?.must_equal true
        subject.errors.messages.must_be_empty
      end
    end

    describe 'invalid' do
      ['invalid_email', 'foo@example. com'].each do |invalid_email|
        it "should add error when email is #{invalid_email}" do
          subject.email = invalid_email
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:email].must_equal ['is not a valid email']
        end
      end
    end
  end
end
