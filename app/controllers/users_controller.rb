#21 #22
class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
end