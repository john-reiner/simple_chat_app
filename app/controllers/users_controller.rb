class UsersController < ApplicationController
    before_action :authenticate_user, only: %i[ show ]
    def show
        @users = User.all_except(@authenticated_user)
        @messages = Message.all

    end

    def new
        @user = User.new
    end

    def create

        @user = User.new(user_params)

        if @user.save
            redirect_to user_url(@user), notice: "User was successfully created."
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
