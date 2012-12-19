module Crowdbase
  class Note
    include Her::Model
    uses_api Crowdbase.api

    belongs_to :user
    belongs_to :topic
  end
end
