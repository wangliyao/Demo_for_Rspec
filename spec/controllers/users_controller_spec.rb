require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'create' do
      it "测试保存用户成功" do
       params = { name: '30001'}
        post :create, params
        expect(response).to redirect_to(:new_password_users)
     end
    end
end
