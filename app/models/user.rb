class User < ApplicationRecord
    has_secure_password
    validates :screen_name, presence: true, uniqueness: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
    
    has_many :messages
    has_many :user_chats
    has_many :chats, through: :user_chats
end
