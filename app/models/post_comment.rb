class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    
    has_many :comment_likes
    has_many :cc, class_name: "CommentsComment", foreign_key: "postcomment_id"

    has_many :likers, through: :comment_likes, source: :user

    def liked_by?(user)
        likers.include? user
    end
end
