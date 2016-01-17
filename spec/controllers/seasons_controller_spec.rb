require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'GET #seasons.json' do
    it 'return seasons ordered by creation and episodes ordered by number' do
      FactoryGirl.factories.map(&:name).each do |factory_name|
        FactoryGirl.create(factory_name) if factory_name =~ /episode/
      end

      get :index, format: :json

      seasons_hash = JSON.parse(response.body).fetch('seasons')
      seasons = seasons_hash.each_with_object({}) do |season, acc|
        acc[season['title']] = season['episodes'].map { |e| e['number'] }
        acc
      end
      expect(seasons).to(
        eq('Dragon Ball' => [30, 40, 50],
           'Lost'        => [50, 80],
           'Seinfeld'    => [25, 30, 36, 40])
      )
    end
  end
end
