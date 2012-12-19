module Crowdbase
  class Section
    include Her::Model
    uses_api Crowdbase.api

    has_many :posts
    has_many :notes
    has_many :links
    has_many :questions
  end
end
