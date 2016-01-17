require 'rails_helper'

RSpec.describe MoviesAndSeasonsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'GET #movies_and_seasons.json' do
    it 'return all movies and seasons ordered by creation' do
      [:dragon_ball, :seinfeld, :lost,
       :three_hundred, :interstellar, :inception].each do |factory_name|
        FactoryGirl.create(factory_name)
      end

      get :index, format: :json

      movies_and_seasons_hash =
        JSON.parse(response.body).fetch('movies_and_seasons')
      movies_and_seasons = movies_and_seasons_hash.flat_map do |m_s|
        { m_s['title'] => m_s['created_at'] }
      end
      expect(movies_and_seasons).to(
        eq([{ 'Dragon Ball'            => '2014-01-10 00:00:00.000000' },
            { 'Lost'                   => '2014-11-10 00:00:00.000000' },
            { 'Seinfeld'               => '2015-01-10 00:00:00.000000' },
            { 'Interstellar'           => '2015-01-11 00:00:00.000000' },
            { '300: Rise of an Empire' => '2015-02-10 00:00:00.000000' },
            { 'Inception'              => '2015-03-10 00:00:00.000000' }])
      )
    end
  end
end
