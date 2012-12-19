module Crowdbase
  class Post
    include Her::Model
    uses_api Crowdbase.api
    custom_get :featured

    belongs_to :user
    has_many :topics
  end
end
