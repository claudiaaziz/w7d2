class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        debugger

        if @user
            login(@user)
            render :show
        else
            flash.now[:errors] = ['Login Failed']
        end
    end 

    def destroy
        logout!
        flash[:messages] = ["Logout Successful"]
        redirect_to new_session_url
    end
end
 