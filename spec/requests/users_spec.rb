require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET users_controller#index' do
    before(:example) { get '/users' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index body correctly" do
      expect(response.body).to include('This is used to display the users home page')
    end

    it "renders index template correctly" do
      expect(response).to render_template(:index)
    end
  end
end