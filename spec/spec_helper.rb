ENV['RACK_ENV'] = 'test'

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rack/segment'
require 'support/mock_app_helper'
require 'rack/test'

RSpec.configure do |config|
  include MockAppHelper
end
