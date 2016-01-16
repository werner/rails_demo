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
  end
end
