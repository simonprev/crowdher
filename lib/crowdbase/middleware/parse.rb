module Crowdbase
  module Middleware
    class Parse < Faraday::Response::Middleware
      # Parse the response body
      #
      # @param [String] body The response body
      # @return [Mixed] the parsed response
      def parse(body)
        json = MultiJson.load(body, :symbolize_keys => true)
        errors = []
        metadata = json.delete(:metadata) || []

        if json.is_a?(Hash) and json[:error].present?
          json.delete(:error)
          json.delete(:message)
        end

        json = json[:body] if json[:body]
        {
          :data => json,
          :errors => errors,
          :metadata => metadata
        }
      end

      # This method is triggered when the response has been received. It modifies
      # the value of `env[:body]`.
      #
      # @param [Hash] env The response environment
      def on_complete(env)
        env[:body] = parse(env[:body])
      end
    end
  end
end

