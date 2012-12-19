module Crowdbase
  module UserRelation
    module Questions
      def questions_liked
        Question.get_collection("#{User.collection_path}/#{id}/questions/liked")
      end

      def questions_following
        Question.get_collection("#{User.collection_path}/#{id}/questions/following")
      end

      def questions_starred
        Question.get_collection("#{User.collection_path}/#{id}/questions/starred")
      end
    end
  end
end
