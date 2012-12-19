module Crowdbase
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options={})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]["Authorization"] = "Bearer #{Thread.current[:crowdbase_access_token]}" unless Thread.current[:crowdbase_access_token].nil?

        # Include client_id and client_secret when requesting a token
        if env[:url].to_s.match("/oauth")
          env[:body][:client_id]     = @options[:client_id]
          env[:body][:client_secret] = @options[:client_secret]
        end

        @app.call(env)
      end
    end
  end
end
