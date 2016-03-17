class SessionsController < ApplicationController
  layout 'static_application'
  def new
  end

  def create
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
