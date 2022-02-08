class MessagesController < ApplicationController

    before_action :authenticate_user

    def create
        @message = Message.create(
            user_id: @authenticated_user.id,
            chat_id: params[:chat_id],
            content: params[:message][:content]
        )

    end
end
