class User < ApplicationRecord
       
    has_many :recived_messages, class_name: 'Message', foreign_key: "reciptient_id"
    has_many :sent_messages, class_name: 'Message', foreign_key: "sender_id"
    
    def contacts
        user_ids = (sent_messages.pluck(:reciptient_id) + recived_messages.pluck(:sender_id)).uniq
        User.where(id: user_ids).order(:name)
    end

    


end
