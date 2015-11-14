require 'spec_helper'

describe Rack::Segment do
  include Rack::Test::Methods

  let(:key) { 'yohSui9A' }
  let(:app) { Rack::Builder.parse_file(app_rackup_file).first }
  let(:app_rackup_file) {
    ::File.expand_path('../../dummy/config.ru', __FILE__)
  }

  before { get '/' }

  it { expect(last_response).to be_ok }

  it 'includes segment analytics snippet' do
    expect(last_response).to match(%r[</title>.*#{key}.*</head>.*</body.*?>]m)
  end
end
