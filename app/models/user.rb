class User < ApplicationRecord
       
    has_many :recived_messages, class_name: 'Message', foreign_key: "reciptient_id"
    has_many :sent_messages, class_name: 'Message', foreign_key: "sender_id"

    has_many :posts
    has_many :post_likes
    has_many :post_comments
    has_many :comments_comments
    has_many :chats

    def contacts
        user_ids = (sent_messages.pluck(:reciptient_id) + recived_messages.pluck(:sender_id)).uniq
        User.where(id: user_ids).order(:name)
    end

    

end
