class UsersController < ApplicationController
    before_action :authenticate_user, only: %i[ show ]
    
    def show
        @chats = @authenticated_user.chats
    end

    def new
        @user = User.new
    end

    def create

        @user = User.new(user_params)
        
        if @user.save
            secret_key = Rails.application.secret_key_base
            token = JWT.encode({
                user_id: @user.id,
            }, secret_key)
            session[:token] = token
            redirect_to chats_url, notice: "User was successfully created."
        else
            flash[:errors] = @user.errors.full_messages
            render :new, status: :unprocessable_entity
        end

    end

    private

    def user_params
        params.require(:user).permit(:email, :screen_name, :password, :password_confirmation )
    end

end
