class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
  def new

  end

  def create
    @user = User.new(email: params[:email],
                    password: params[:password])
    if @user.save
      redirect_to action: "index"
    else
      redirect_to :back
    end
  end
end