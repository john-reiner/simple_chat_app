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
            @chat.messages.create(user_id: @authenticated_user.id, content: "#{@authenticated_user.screen_name} joined this chat!")
            @chat.messages.create(user_id: other_user.id, content: "#{other_user.screen_name} joined this chat!")

            redirect_to @chat
        else
            redirect_to new_chat_path, notice: "Screen Name '#{params[:chat][:name]}' not found"
        end

    end

    def update

    end

    def destroy
    
    end
end
