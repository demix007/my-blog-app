require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET posts_controller#index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders index body correctly' do
      expect(response.body).to include('This is responsible for showing post with User_id')
    end

    it 'renders the index template correctly' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET posts_controller#show' do
    before(:example) { get '/users/:user_id/posts/:post_id' }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index body correctly' do
      expect(response.body).to include('This is used to display post with post_id and user with user_id')
    end

    it 'renders the show template correctly' do
      expect(response).to render_template(:show)
    end
  end
end
