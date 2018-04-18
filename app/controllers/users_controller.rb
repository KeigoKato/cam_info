class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @pictures = current_user.pictures
  end

end
