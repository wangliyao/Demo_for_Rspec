require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it "测试保存用户成功" do
      post :create, user: FactoryGirl.attributes_for(:user, password: nil)
      expect(response).to redirect_to(:new_password_users)
    end
  end

  describe 'password save' do
    it "测试用户保存密码成功" do
      post :create_password, user: FactoryGirl.attributes_for(:user)
      expect(response).to be_success
    end
  end

  describe 'change password redirect root' do
    it "测试用户修改密码成功" do
      user = create(:user)
      get :change, id: user
      expect(response).to be_success
    end
  end
end
