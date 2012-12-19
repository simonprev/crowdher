# Dependencies
require "her"

# Modules
require "crowdbase/version"
require "crowdbase/config"
require "crowdbase/middleware/parse"
require "crowdbase/middleware/version"
require "crowdbase/middleware/auth"

module Crowdbase
  def self.api
    @api
  end

  def self.configure(&blk)
    options = OpenStruct.new
    yield(options)

    @api = Her::API.new
    @api.setup :url => "https://api.crowdbase.com/" do |connection|
      # Request middleware
      connection.use Crowdbase::Middleware::Version
      connection.use Crowdbase::Middleware::Auth, client_id: options.client_id, client_secret: options.client_secret
      connection.use Faraday::Request::UrlEncoded

      # Response middleware
      connection.use Crowdbase::Middleware::Parse
      connection.use Faraday::Adapter::NetHttp
    end

    require "crowdbase/user"
    require "crowdbase/note"
    require "crowdbase/question"
    require "crowdbase/link"
    require "crowdbase/topic"
    require "crowdbase/post"
    require "crowdbase/notification"
    require "crowdbase/search"
  end
end
