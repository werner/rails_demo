FactoryGirl.define do
  factory :three_hundred, class: 'Movie' do
    title '300: Rise of an Empire'
    plot  'Greek general Themistokles leads the charge against invading ' +
          'Persian forces led by mortal-turned-god Xerxes and Artemisia, vengeful commander of the Persian navy.'
    created_at '2015-02-10 00:00:00'
  end

  factory :interstellar, class: 'Movie' do
    title 'Interstellar'
    plot  'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'
    created_at '2015-01-10 00:00:00'
  end

  factory :inception, class: 'Movie' do
    title 'Inception'
    plot  'A thief who steals corporate secrets through use of the ' +
          'dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.'
    created_at '2015-03-10 00:00:00'
  end
end
