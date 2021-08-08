class Admin::UsersController < AdminController
	before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end
  
  def show; end 

  def attendance
    @attendance = User.find(params[:id]).daily_attendances
  end

  #def destroy_attendance
  #  @dailyattendance = User.find(params[:id]).daily_attendances.find(params[:id])
  #  @dailyattendance.destroy
  #end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), notice: 'user has been created successfully' }
        format.js
      else
        format.js
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

    # User without password update data
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update(user_params)
      format.html { redirect_to admin_user_path(@user), notice: 'user has been updated successfully'}
      format.js
    else
      format.html { render :edit }
      format.js
    end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|

    format.html {redirect_to admin_users_path, notice: 'user has been deleted successfully'}
    format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def set_article
    @user = User.find(params[:id])
  end
end
