class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_many :cc, class_name: "CommentsComment", foreign_key: "postcomment_id"
end
