module Crowdbase
  module UserRelation
    module Topics
      def topics
        Topic.get_collection("#{User.collection_path}/#{id}/topics/following")
      end

      def latest_topics
        Topic.get_collection("#{User.collection_path}/#{id}/topics/following/latest")
      end
    end
  end
end
