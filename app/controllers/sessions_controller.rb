class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(:name => params[:name], :password => params[:password])
    if @user.present?
      session[:user_id] =@user.id
      redirect_to root_path, :name => @user.name
    else
      flash[:error] = '账号或密码输入错误'
      render action: :new
    end
  end

  def msg_login
    @user = User.find_by(:name => params[:name], :code => params[:code])
    if @user.present?
      session[:user_id] =@user.id
      redirect_to root_path, :name => @user.name
    else
      flash[:error] = '账号或验证码输入错误'
      render action: :new
    end
  end

  def login_out
    session[:user_id] = nil
    flash[:notice]= '退出成功'
    redirect_to ({:controller => 'home', :action => 'index'})
  end

end
