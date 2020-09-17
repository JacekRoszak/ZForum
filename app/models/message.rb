class Message < ApplicationRecord
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :reciptient, class_name: 'User', foreign_key: 'reciptient_id'

    scope :to_user, -> (reciptient_id){ where(reciptient_id: reciptient_id)} 
    scope :from_user, -> (sender_id){ where(sender_id: sender_id)} 
end


# def self.to(reciptient_id)
#     where(reciptient_id: reciptient_id)
# end
