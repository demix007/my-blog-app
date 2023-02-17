class UsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @id = params[:id]
  end
end
