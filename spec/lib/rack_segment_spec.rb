require 'spec_helper'

module Rack
  describe Segment do
    let(:key) { 'iJeedae3' }
    let(:middleware) { described_class.new(mock_app, key: key) }
    let(:request) { Rack::MockRequest.new(middleware) }

    context 'for a text/html response' do
      subject { request.get('/').body }

      it 'adds the analytics snippet before closing head tag' do
        expect(subject).to match(%r[#{key}.*</head>.*<body.*?>.*Works!<\/body>]m)
      end
    end

    context 'for a text/html response with uppercase html tags' do
      subject { request.get('/uppercase_tags.html').body }

      it 'adds the analytics snippet before closing head tag' do
        expect(subject).to match(%r[#{key}.*</HEAD>.*<BODY.*?>.*Works!<\/BODY>]m)
      end
    end

    context 'for a text/html response without head tag' do
      subject { request.get('/fragment.html').body }

      it 'does not add the analytics snippet' do
        expect(subject).not_to include(key)
      end

      it 'does not modify the response' do
        expect(subject).to eq(mock_html_fragment)
      end
    end

    context 'for no text/html responses' do
      subject { request.get('/test.json').body }

      it 'does not add the analytics snippet' do
        expect(subject).not_to include(key)
      end

      it 'does not modify the response' do
        expect(subject).to eq(mock_json_response)
      end
    end
  end
end
