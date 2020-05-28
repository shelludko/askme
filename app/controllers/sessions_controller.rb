class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Вы вошли на сайт!'
    else
      flash.now.alert = 'Неправильный логин или пароль!'
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Вы вышли! Приходите ещё!'
  end
end
