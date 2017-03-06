class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
    def show
     @user = User.find(params[:id])
     @microposts = @user.microposts.order(created_at: :desc)
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
    end
    
    def following
      @title = "Following"
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
    end
    
    def followers
      @title = "Followers"
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follow'
    end
    
    def edit
    end
    
    def update
      if @user.update(user_params)
        redirect_to user_path , notice: 'ユーザー情報を編集しました'
      else
        render 'edit'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :region, :profile)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
