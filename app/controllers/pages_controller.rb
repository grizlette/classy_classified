class PagesController < ApplicationController

  def index
  end

  def showmine
    @user = User.find(current_user.id)
  end

end
