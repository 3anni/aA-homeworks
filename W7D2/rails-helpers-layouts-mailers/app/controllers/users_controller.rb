class UsersController < ApplicationController
  before_action :require_logged_out

  after_action :send_welcome_email, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:password, :username)
  end

  def send_welcome_email
    msg = UserMailer.welcome_email(@user)
    msg.deliver_now
  end
end
