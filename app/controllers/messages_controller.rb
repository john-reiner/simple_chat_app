class MessagesController < ApplicationController

    before_action :authenticate_user


    def create
        chat = Chat.find_by(id: params[:chat_id])
        chat.messages.create!(
            user: @authenticated_user,
            chat: chat,
            content: params[:message][:content]
        )

    end

end
