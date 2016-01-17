require 'rails_helper'

RSpec.describe LibraryController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'GET #library.json' do

    before(:each) do
      stub_const('Purchase::ACTIVE_DAYS', 3.days)
      allow(Time).to receive(:now).and_return('2015-01-12 00:00:00'.to_time)

      FactoryGirl.create(:purchase_interstellar, 
                         user: User.find_by(email: 'admin@admin.com'))
      FactoryGirl.create(:purchase_three_hundred, 
                         user: User.find_by(email: 'admin@admin.com'))
      FactoryGirl.create(:purchase_inception, 
                         user: User.find_by(email: 'admin@admin.com'))

      get :index, format: :json
    end

    it 'get the active products' do
      expect(response.body).to include("Interstellar")
      expect(response.body).to include("300: Rise of an Empire")
      expect(response.body).to_not include("Inception")
    end

    it 'get the content ordered by purchase date' do
      dates = JSON.parse(response.body)["library"].map {|l| l["purchasable"]["created_at"].to_time }
      #this splits and compares the dates to see if they are ordered, it's using
      #the spaceship operator to compare the dates
      expect(dates.each_cons(2).all? { |a, b| (a <=> b) <= 0 }).to be_truthy
    end
  end

end
