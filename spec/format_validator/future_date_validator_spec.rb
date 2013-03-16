require_relative '../spec_helper'

describe 'FutureDateValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :expiration_date
        validates :expiration_date, future_date: true
      end
    end

    let(:one_day) { 60 * 60 * 24 }

    subject { klass.new }

    describe 'valid' do
      it 'should not add any error' do
        subject.expiration_date = Time.now + one_day
        subject.valid?.must_equal true
        subject.errors.messages.must_be_empty
      end
    end

    describe 'invalid' do
      it 'should add error when expiration date is in the past' do
        subject.expiration_date = Time.now - one_day
        subject.valid?.must_equal false
        subject.errors.messages.size.must_equal 1
        subject.errors.messages[:expiration_date].must_equal ['must be in the future']
      end

      it 'should not blow up if the expirate date is nil' do
        subject.valid?.must_equal false
        subject.errors.messages.size.must_equal 1
        subject.errors.messages[:expiration_date].must_equal ['must be in the future']
      end
    end
  end
end
