class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      flash[:notice] = "Login successful"
      redirect_back_or_to root_url
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  private

  def user_params
    params.require(:users).permit(:email,:password)
  end
end
