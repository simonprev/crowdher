module Crowdbase
  class Search
    include Her::Model
    uses_api Crowdbase.api

    def self.query(q, opts={})
      get('/search', opts.merge(q: q))
    end

    def self.grouped_query(q, opts={})
      query(q, opts).group_by(&:type)
    end
  end
end
