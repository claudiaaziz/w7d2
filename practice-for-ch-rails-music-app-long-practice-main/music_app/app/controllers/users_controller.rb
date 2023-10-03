class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        render :new
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_digest, :session_token)
    end
end
