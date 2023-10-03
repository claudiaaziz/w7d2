class SessionsController < ApplicationController
    def new
        
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        debugger

        if @user
            login(@user)
            render :show
        else
            flash.now[:errors] = ['Login Failed']
        end
    end 
end
 