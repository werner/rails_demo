FactoryGirl.define do
  factory :purchase_interstellar, class: 'Purchase' do
    association :purchasable, factory: :interstellar
    association :purchase_option, factory: :interstellar_first_option
    association :user
    created_at '2015-01-11 00:00:00'
  end
end
