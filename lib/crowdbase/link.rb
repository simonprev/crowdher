module Crowdbase
  class Link
    include Her::Model
    uses_api Crowdbase.api

    belongs_to :user
    has_many :topics
  end
end
