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
    end

    def create
        other_user = User.find_by(screen_name: params[:chat][:name])

        if other_user
            @chat = Chat.create(name: other_user.screen_name)
            redirect_to @chat

        else
            redirect_to new_chat_path, notice: "Screen Name '#{params[:chat][:name]}' not found"
        end

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
