require_relative '../spec_helper'

describe 'UrlFormatValidator' do
  describe '#validate_each' do
    let(:klass) do
      Class.new do
        attr_accessor :url
        include ActiveModel::Validations
        validates :url, url_format: true
      end
    end

    subject { klass.new }

    describe 'valid' do
      %w[http://foo.com https://foo.com].each do |_url|
        it "should not add any error when the url is #{_url}" do
          subject.url = _url
          subject.valid?.must_equal true
          subject.errors.messages.must_be_empty
        end
      end
    end

    describe 'invalid' do
      %w[foo.com http://foo foo].each do |_url|
        it "should add error when url is (#{_url})" do
          subject.url = _url
          subject.valid?.must_equal false
          subject.errors.messages.size.must_equal 1
          subject.errors.messages[:url].must_equal ['is not valid']
        end
      end
    end
  end
end
