require_relative '../spec_helper'

describe 'HostnameFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        include ActiveModel::Validations
        attr_accessor :hostname
        validates :hostname, hostname_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      %w[www.example.com example.com foo.example.com].each do |_hostname|
        it "should not add any error when the hostname is #{_hostname}" do
          subject.hostname = _hostname
          subject.valid?.must_equal true
          subject.errors.messages.must_be_empty
        end
      end
    end

    describe 'invalid' do
      ['example',  'http://example.com', 'example. com'].each do |_hostname|
        it "should add error when hostname is (#{_hostname})" do
          subject.hostname = _hostname
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:hostname].must_equal ['is invalid']
        end
      end
    end
  end
end
