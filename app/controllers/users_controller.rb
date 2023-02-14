class UsersController < ApplicationController
  def index; end

  def posts
    @id = params[:user_id]
  end

  def show
  end
end
