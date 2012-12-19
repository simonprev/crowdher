module Crowdbase
  class Topic
    include Her::Model
    uses_api Crowdbase.api
    custom_get :search

    has_many :posts
    has_many :notes
    has_many :links
    has_many :questions

    def follow!(user_id)
      post("#{Topic.collection_path}/#{id}/follow")
    end

    def unfollow!(user_id)
      post("#{User.collection_path}/#{id}/unfollow")
    end
  end
end
