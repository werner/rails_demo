FactoryGirl.define do
  factory :purchase_interstellar, class: 'Purchase' do
    association :purchasable, factory: :interstellar
    association :purchase_option, factory: :interstellar_first_option
    association :user
    created_at '2015-01-10 00:00:00'
  end

  factory :purchase_three_hundred, class: 'Purchase' do
    association :purchasable, factory: :three_hundred
    association :purchase_option, factory: :three_hundred_second_option
    association :user
    created_at '2015-01-11 00:00:00'
  end

  factory :purchase_inception, class: 'Purchase' do
    association :purchasable, factory: :inception
    association :user
    created_at '2015-01-04 00:00:00'
  end

end
