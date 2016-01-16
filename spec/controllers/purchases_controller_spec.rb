require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  include Devise::TestHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end

  describe 'POST #purchases' do
    it 'purchase a movie' do
      three_hundred = FactoryGirl.create(:three_hundred_with_choosable)

      expect {
        post :create, 
          purchase: {
            purchasable_id: three_hundred.id,
            purchasable_type: three_hundred.class.to_s,
            purchase_option_id: three_hundred.purchase_options.first.id
          }, format: :json
      }.to change(Purchase, :count).by(1)
      
    end

    it 'will not purchase a movie and shows an error' do
      
      purchase = FactoryGirl.create(:purchase_interstellar)
      interstellar = purchase.purchasable

      stub_const('Purchase::ACTIVE_DAYS', 3.days)
      allow(Time).to receive(:now).and_return('2015-01-12 00:00:00'.to_time)
      post :create, 
        purchase: {
          purchasable_id: interstellar.id,
          purchasable_type: interstellar.class.to_s,
          purchase_option_id: purchase.purchase_option.id
        }, format: :json

      expect(JSON.parse(response.body)['base']).to eq(['You are still available to watch Interstellar'])
    end
  end
end
