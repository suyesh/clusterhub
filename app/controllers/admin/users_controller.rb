class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.order(:status)
    # filter by pending (those who didn't activate the account yet)
    # filter by Email
    # https://github.com/activerecord-hackery/ransack

  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
