FactoryGirl.define do
  factory :three_hundred_first_option, class: 'PurchaseOption' do
    price 5.23
    video_quality 'SD'
  end

  factory :three_hundred_second_option, class: 'PurchaseOption' do
    price 8.76
    video_quality 'HD'
  end

  factory :three_hundred_third_option, class: 'PurchaseOption' do
    price 10.76
    video_quality 'HD'
  end

  factory :interstellar_first_option, class: 'PurchaseOption' do
    price 4.50
    video_quality 'SD'
  end

  factory :interstellar_second_option, class: 'PurchaseOption' do
    price 9.99
    video_quality 'HD'
  end

  factory :interstellar_third_option, class: 'PurchaseOption' do
    price 12.88
    video_quality 'HD'
  end
end
