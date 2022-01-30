class ChatsController < ApplicationController

    before_action :authenticate_user

    def index
        @chats = @authenticated_user.chats
    end

    def show
        @chat = Chat.find_by(id: params[:id])
        @message = Message.new
    end

    def new
        @chat = Chat.new
        byebug
    end

    def create
    
    end

    def update
        @chat = Chat.find_by(id: params[:id])
        @chat.messages.create(
            user_id: @authenticated_user.id,
            content: params[:chat][:content]
        )
    end

    def destroy
    
    end
end
