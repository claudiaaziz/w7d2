class ApplicationController < ActionController::Base
    helper_method :logged_in?

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def current_user
        @user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end
end
