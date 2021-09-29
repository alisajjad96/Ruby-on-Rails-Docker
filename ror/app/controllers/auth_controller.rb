class AuthController < ApplicationController

  before_action :auth_check, only: [:logout]

  def sign_in

  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Your have successfully logged in."
      redirect_to root_path
    else
      flash[:warning] = "Either your email or password is incorrect."
      render 'sign_in'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Your have successfully logged out."
    redirect_to sign_in_path
  end

  def users
    abort User.all.inspect
  end

  def test_create_user

    res = User.new(
      first_name: 'Test',
      last_name: 'User 1',
      display_name: 'Test User 1',
      email: 'alisajjad11111@gmail.com',
      password: 'test',
      password_confirmation: 'test',
    )

    abort res.save.inspect

  end
end
