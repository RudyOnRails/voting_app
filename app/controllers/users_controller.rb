class UsersController < ApplicationController
  def show
    @looked_up_user = User.find_by_id(@current_user)
  end
end