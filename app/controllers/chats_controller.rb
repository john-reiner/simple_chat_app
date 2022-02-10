class ChatsController < ApplicationController

    before_action :authenticate_user

    def show

        @chat = Chat.find_by(id: params[:id])
        @messages = @chat.messages
        @message = Message.new
        @other_users = @chat.users.where.not(id: @authenticated_user)

    end

    def new
        @chat = Chat.new
    end

    def create_user_chat 

    end

    def create
        other_user = User.find_by(screen_name: params[:chat][:screen_name])
        if other_user
            @chat = Chat.create(name: nil)
            if @chat.save
                @chat.users << @authenticated_user
                @chat.users << other_user
                @chat.messages.create(
                    user_id: @authenticated_user.id,
                    chat_id: @chat.id,
                    content: "#{@authenticated_user.screen_name} added #{other_user.screen_name} to the chat"
                )
                redirect_to user_chat_url(@authenticated_user, @chat)
            else
                redirect_to @authenticated_user, notice: "Something went wrong..."
            end
        else
            redirect_to @authenticated_user, notice: "Screen Name '#{params[:chat][:screen_name]}' not found"
        end

    end

    def update

    end

    def destroy
    
    end
end
