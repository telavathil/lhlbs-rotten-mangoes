class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy, :update]

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

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_user_path, notice: 'Movie was successfully destroyed.' }
        format.json { head :no_content }
      end
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
