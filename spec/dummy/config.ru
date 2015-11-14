$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'rack/segment'
require_relative 'app'

use Rack::Segment, key: 'yohSui9A'
use Rack::Lint
run Dummy::App.new
