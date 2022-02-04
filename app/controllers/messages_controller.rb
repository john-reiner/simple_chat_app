class MessagesController < ApplicationController

    before_action :authenticate_user

    def create
        @message = Message.create(
            user_id: @authenticated_user.id,
            chat_id: params[:chat_id],
            content: params[:message][:content]
        )

        respond_to do |format|
            if !@message.save
                # format.turbo_stream { render turbo_stream: turbo_stream.replace("message_form", partial: "messages/form", locals: {message: @message})}
                format.html { render partial: "form" }
            end
        end
    end
end
