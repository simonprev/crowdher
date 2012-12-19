module Crowdbase
  module UserRelation
    module Posts
      def posts_liked
        Post.get_collection("#{User.collection_path}/#{id}/posts/liked")
      end

      def posts_following
        Post.get_collection("#{User.collection_path}/#{id}/posts/following")
      end

      def posts_starred
        Post.get_collection("#{User.collection_path}/#{id}/posts/starred")
      end
    end
  end
end
