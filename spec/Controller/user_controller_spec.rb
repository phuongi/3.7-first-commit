require 'rails_helper'
@user = FactoryGirl.create(:user)

describe UsersController, :type => :controller do

  let(:user) { User.create!(email: 'peter@example.com', password: '1234567890') }

  describe 'GET #show' do
     context 'User is logged in' do
      before do
       sign_in user
      end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:user)).to eq user
    end

     context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end
end