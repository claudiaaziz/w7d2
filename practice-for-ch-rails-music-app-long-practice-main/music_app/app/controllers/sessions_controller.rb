class SessionsController < ApplicationController

    def new
        
    end

    def create
        debugger
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            render :show
        else
            
        end
    end 
end
 