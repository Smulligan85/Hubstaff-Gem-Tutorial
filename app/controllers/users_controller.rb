class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thank you for signing up"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def client
  end

  def auth_client
    user = current_user
    if params[:hubstaff_email].present? && params[:hubstaff_password].present?
      client = Hubstaff::Client.new(params[:hubstaff_email], params[:hubstaff_password])
      if client.nil?
        redirect_to user_path(user), alert: "Unable to Connect to Hubstaff"
      else
        user.client = client
        user.save
        redirect_to user_path(user), notice: "Connected to Hubstaff"
      end
    else
      redirect_to user_path(user), alert: "Unable to Connect to Hubstaff"
    end
  end

  def custom_report
    user = current_user
    @report = user.client.custom_date_team(params[:start_date], params[:end_date])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
