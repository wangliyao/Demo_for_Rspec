class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(:name => params[:name])
    if @user.save
      session[:user_id] = @user.id
      redirect_to ({:controller => 'users', :action => 'new_password'})
    else
      render action: :new
    end
  end

  def new_password
  end

  def create_password
    @user = User.find_by(:id => session[:user_id])
    if @user.present?
      @user.password_hash = params[:password]
      @user.update_attributes(:password => @user.password)
      redirect_to root_path
    else
      render change_password_users_path
    end
  end

  def change_password
  end

  def change
    @user = User.find_by(:id => session[:user_id])
    if @user.present? && @user.password_hash == params[:old_password]
      @user.password_hash = params[:password]
      @user.update_attributes(:password => @user.password)
      redirect_to root_path
    else
      flash[:notice] = '原密码错误'
      render change_password_users_path
    end
  end

  def send_message
    user = User.find_by_name(params[:phone_msg])
    if user.present? && params[:flag] != 'login'
      render :text => '该手机号已被注册'
    else
      num = User.message(params[:phone_msg], params[:flag])
      render :text => num
    end
  end
end
