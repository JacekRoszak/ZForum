class Post < ApplicationRecord
    belongs_to :user
    has_many :post_likes
    has_many :post_comments
    
    has_many :likers, through: :post_likes, source: :user
    

    def liked_by?(user)
        likers.include? user
    end
end
