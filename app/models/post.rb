class Post < ApplicationRecord
    belongs_to :user
    has_many :post_likes
    has_many :likers, through: :post_likes, source: :user
end
