module Crowdbase
  module UserRelation
    module Links
      def links_liked
        Link.get_collection("#{User.collection_path}/#{id}/links/liked")
      end

      def links_following
        Link.get_collection("#{User.collection_path}/#{id}/links/following")
      end

      def links_starred
        Link.get_collection("#{User.collection_path}/#{id}/links/starred")
      end
    end
  end
end
