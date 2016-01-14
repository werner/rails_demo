require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'GET #movies.json' do
    it 'return all movies ordered by creation' do

      three_hundred = FactoryGirl.create(:three_hundred)
      interstellar  = FactoryGirl.create(:interstellar)
      inception     = FactoryGirl.create(:inception)

      get :index, format: :json
      
      expect(JSON.parse(response.body).fetch("movies").map{|m| m["title"]}).to(
        eq([interstellar, three_hundred, inception].map(&:title))
      )
    end
  end
end
