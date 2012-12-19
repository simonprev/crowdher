module Crowdbase
  module UserRelation
    module Users
      def followers
        User.get_collection("#{User.collection_path}/#{id}/users/followers")
      end

      def followings
        User.get_collection("#{User.collection_path}/#{id}/users/followers")
      end

      def follow!(user_id)
        post("#{User.collection_path}/#{id}/follow", user_id: user_id)
      end

      def unfollow!(user_id)
        post("#{User.collection_path}/#{id}/unfollow", user_id: user_id)
      end
    end
  end
end
