FactoryGirl.define do
  factory :three_hundred, class: 'Movie' do
    title '300: Rise of an Empire'
    plot  'Greek general Themistokles leads the charge against invading ' +
          'Persian forces led by mortal-turned-god Xerxes and Artemisia, vengeful commander of the Persian navy.'
    created_at '2015-02-10 00:00:00'

    factory :three_hundred_with_choosable do
      after (:create) do |three_hundred|
        create(:three_hundred_first_option, 
               choosable_id: three_hundred.id, 
               choosable_type: three_hundred.class.to_s)
        create(:three_hundred_second_option, 
               choosable_id: three_hundred.id, 
               choosable_type: three_hundred.class.to_s)
        create(:three_hundred_third_option, 
               choosable_id: three_hundred.id, 
               choosable_type: three_hundred.class.to_s)
      end
    end
  end

  factory :interstellar, class: 'Movie' do
    title 'Interstellar'
    plot  'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'
    created_at '2015-01-11 00:00:00'

    factory :interstellar_with_choosable do
      after (:create) do |interstellar|
        create(:interstellar_first_option, 
               choosable_id: interstellar.id, 
               choosable_type: interstellar.class.to_s)
        create(:interstellar_second_option, 
               choosable_id: interstellar.id, 
               choosable_type: interstellar.class.to_s)
        create(:interstellar_third_option, 
               choosable_id: interstellar.id, 
               choosable_type: interstellar.class.to_s)
      end
    end
  end

  factory :inception, class: 'Movie' do
    title 'Inception'
    plot  'A thief who steals corporate secrets through use of the ' +
          'dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.'
    created_at '2015-03-10 00:00:00'
  end
end
