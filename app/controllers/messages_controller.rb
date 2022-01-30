class MessagesController < ApplicationController

    before_action :authenticate_user

    def new
        # @message = Message.new
    end

    def create
        byebug
    end
end
