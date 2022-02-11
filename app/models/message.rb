class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  after_create_commit -> {
    # line 6 is in the chat show page, so we update the chat show page only once a message is created 
    broadcast_append_to "messages", target: self.chat
    # broadcast_replace_to "chat_links", target: self.chat, partial: "shared/chat_link", locals: { chat: self.chat, user: self.user }
  }

  validates :content, presence: true

end
