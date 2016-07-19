class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def new
        @user = User.new
    end

    def index
      if current_user.admin?
        @users = User.page(params[:page])
      else
        redirect_to movies_url
      end
    end

    def show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id # auto log in
            redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
        else
            render :new
        end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    protected

    def user_params
        params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
    end
end
