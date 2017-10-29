class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:email],params[:password])

    if @user
      log_in_user!(@user)
      redirect_to user_url
    else
      flash.now(:errors)
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    render :new
  end
end
