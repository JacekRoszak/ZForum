class CommentsComment < ApplicationRecord
    belongs_to :user
    belongs_to :post_comment, class_name: 'PostComment', foreign_key: 'postcomment_id'
end
