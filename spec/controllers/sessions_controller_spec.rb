require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'Post #create' do
    it 'success create ' do
      post :create, user: attributes_for(:user, code: nil)
      expect(response).to be_success
    end
  end

  describe 'Post #,msg_login' do
    it 'success msg_login ' do
      post :msg_login, user: attributes_for(:user, password: nil)
      expect(response).to be_success
    end
  end

  describe 'Post #,login_out' do
    it 'success login_out ' do
      get :login_out
      expect(response).to redirect_to(:root)
    end
  end
end
