class User < ApplicationRecord
    has_secure_password
    validates :screen_name, presence: true, uniqueness: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
    scope :all_except, -> (user) { where.not(id: user) }
    has_many :messages
    has_many :chats, through: :messages
end
