class PagesController < ApplicationController
  def index
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      p session
      redirect_to "/"
    else
      @errors = "The credentials provided do not match"
      # redirect_to :back
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/"
  end
end