class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :chat
  after_create_commit {broadcast_append_to chat}
end
