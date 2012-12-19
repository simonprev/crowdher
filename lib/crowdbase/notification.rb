module Crowdbase
  class Notification
    include Her::Model
    uses_api Crowdbase.api

    belongs_to :user
  end
end
