class ApplicationController < ActionController::Base

    def authenticate_user

        if session[:token]

            secret_key = Rails.application.secret_key_base
            
            decoded_token = JWT.decode(session[:token], secret_key)[0]
            @authenticated_user = User.find_by(id: decoded_token["user_id"])
            if @authenticated_user == nil
                session[:token] = nil
            end
        else
            render status: :unauthorized
        end
    end

end
