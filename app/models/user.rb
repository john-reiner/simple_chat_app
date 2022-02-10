class User < ApplicationRecord
    has_secure_password
    validates :screen_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }
    has_many :messages
    has_many :user_chats
    has_many :chats, through: :user_chats
end
