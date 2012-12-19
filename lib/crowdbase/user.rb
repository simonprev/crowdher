require_relative './user_relations/topics'
require_relative './user_relations/users'
require_relative './user_relations/posts'
require_relative './user_relations/notes'
require_relative './user_relations/links'
require_relative './user_relations/questions'
require_relative './user_relations/semantics'

module Crowdbase
  class User
    include Her::Model
    include Crowdbase::UserRelation::Topics
    include Crowdbase::UserRelation::Users
    include Crowdbase::UserRelation::Posts
    include Crowdbase::UserRelation::Notes
    include Crowdbase::UserRelation::Links
    include Crowdbase::UserRelation::Questions
    include Crowdbase::UserRelation::Semantics

    uses_api Crowdbase.api
    custom_get :search

    # Relations
    has_many :posts
    has_many :notes
    has_many :links
    has_many :questions
    has_many :notifications

    # Class methods
    #
    def self.sign_in!(email, password, subdomain)
      params = {
        username: email,
        password: password,
        subdomain: subdomain,
        grant_type: "password"
      }
      post_raw("oauth/token", params) do |parsed_data|
        set_session_user! parsed_data[:data][:access_token], parsed_data[:data][:user_id]
      end
    end

    def self.set_session_user!(access_token, user_id)
      Thread.current[:crowdbase_user_id]      = user_id
      Thread.current[:crowdbase_access_token] = access_token
    end

    def self.sign_out!
      Thread.current[:crowdbase_user_id]      = nil
      Thread.current[:crowdbase_access_token] = nil
      Thread.current[:crowdbase_access_token].nil?
    end

    def self.me
      find(Thread.current[:crowdbase_user_id]) if Thread.current[:crowdbase_user_id]
    end
  end
end
