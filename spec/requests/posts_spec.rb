require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET posts_controller#index' do
    before(:example) { get '/users/:user_id/posts' } # get(:index)
  end
end