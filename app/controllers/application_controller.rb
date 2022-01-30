class ApplicationController < ActionController::Base

    def authenticate_user

        if session[:token]

            secret_key = Rails.application.secret_key_base
            
            decoded_token = JWT.decode(session[:token], secret_key)[0]
            @authenticated_user = User.find_by(id: decoded_token["user_id"])
            if @authenticated_user == nil
                session[:token] = nil
                redirect_to root_path
            end

        else
            redirect_to new_session_path
        end
    end

end
