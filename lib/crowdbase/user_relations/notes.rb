module Crowdbase
  module UserRelation
    module Notes
      def notes_liked
        Topic.get_collection("#{User.collection_path}/#{id}/notes/liked")
      end

      def notes_following
        Topic.get_collection("#{User.collection_path}/#{id}/notes/following")
      end

      def notes_starred
        Topic.get_collection("#{User.collection_path}/#{id}/notes/starred")
      end
    end
  end
end
