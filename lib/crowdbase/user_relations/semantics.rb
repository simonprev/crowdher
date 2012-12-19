module Crowdbase
  module UserRelation
    module Semantics
      def interests
        get_raw("#{User.collection_path}/#{id}/interests")
      end

      def contributions
        get_raw("#{User.collection_path}/#{id}/contributions")
      end
    end
  end
end
