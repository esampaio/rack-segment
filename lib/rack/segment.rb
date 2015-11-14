require 'rack/segment/version'

module Rack
  class Segment
    def initialize(app, key: nil)
      @app, @key = app, key
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      @status, @headers, @body = app.call(env)
      return [@status, @headers, @body] unless html_response?

      response = Rack::Response.new([], @status, @headers)
      @body.each { |fragment| response.write(inject_in(fragment)) }

      @body.close if @body.respond_to?(:close)

      response.finish
    end

    private

    attr_reader :app, :key

    def html_response?
      @headers['Content-Type'] =~ %r{text/html}
    end

    def inject_in(response)
      response.sub(close_head_tag_regex, "#{analytics_snippet}\n\\0")
    end

    def close_head_tag_regex
      %r{</head>}im
    end

    def analytics_snippet
      @analytics_snippet ||= <<-EOS
<!-- Segment Start -->
<script type="text/javascript">
!function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","page","once","off","on"];analytics.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);analytics.push(e);return analytics}};for(var t=0;t<analytics.methods.length;t++){var e=analytics.methods[t];analytics[e]=analytics.factory(e)}analytics.load=function(t){var e=document.createElement("script");e.type="text/javascript";e.async=!0;e.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.com/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(e,n)};analytics.SNIPPET_VERSION="3.1.0";
analytics.load("#{key}");
analytics.page()
}}();
</script>
<!-- Segment End -->
      EOS
    end
  end
end
