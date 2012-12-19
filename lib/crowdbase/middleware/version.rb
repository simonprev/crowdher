module Crowdbase
  module Middleware
    class Version < Faraday::Middleware
      def initialize(app, options={})
        @app = app
        @options = options
      end

      def call(env)
        env[:url] = URI(env[:url].to_s.sub("api.crowdbase.com", "api.crowdbase.com/v#{Crowdbase::Config::API_VERSION}")) unless env[:url].to_s.match(/oauth/)
        @app.call(env)
      end
    end
  end
end
