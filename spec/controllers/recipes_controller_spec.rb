require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      sign_in user(:matt)
      get :index
      expect(response).to be_successful
    end
  end
end