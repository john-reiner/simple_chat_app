class UserChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  after_create_commit { broadcast_append_to "chat_links", partial: "shared/chat_link", target: self.user, locals: { chat: self.chat}}
end
