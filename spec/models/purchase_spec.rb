require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'User can only purchase active movies' do

    let(:movie) { FactoryGirl.create(:interstellar_with_choosable) }

    before(:each) do
      Purchase.create(purchasable: movie,
                      purchase_option_id: movie.purchase_options.first.id,
                      user: FactoryGirl.create(:user),
                      created_at: '2015-01-11 00:00:00'.to_time)
      
      stub_const('Purchase::ACTIVE_DAYS', 3.days)
    end

    it 'will purchase a movie' do
      allow(Time).to receive(:now).and_return('2015-01-14 00:00:00'.to_time)

      Purchase.create(purchasable: movie,
                      purchase_option_id: movie.purchase_options.first.id,
                      user: User.first,
                      created_at: '2015-01-11 00:00:00'.to_time)

      expect(Purchase.count).to eq(2)
    end

    it 'will not purchase a movie' do
      allow(Time).to receive(:now).and_return('2015-01-13 00:00:00'.to_time)

      purchase = Purchase.create(purchasable: movie,
                                 purchase_option_id: movie.purchase_options.first.id,
                                 user: User.first,
                                 created_at: '2015-01-11 00:00:00'.to_time)

      expect(purchase.errors[:base]).to include('You are still available to watch Interstellar')
    end
    
  end
end
