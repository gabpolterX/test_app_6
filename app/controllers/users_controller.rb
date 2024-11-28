class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def edit
        
    end

    def show
        @articles = @user.articles
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your Profile was successfully updated"
            redirect_to articles_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha blog #{@user.username}, you have successfully sign up"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end