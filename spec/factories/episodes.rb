FactoryGirl.define do
  factory :dragon_ball_first_episodes, class: 'Episode' do
    number 40
    association :season, factory: :dragon_ball
  end

  factory :dragon_ball_second_episodes, class: 'Episode' do
    number 50
    association :season, factory: :dragon_ball
  end

  factory :dragon_ball_third_episodes, class: 'Episode' do
    number 30
    association :season, factory: :dragon_ball
  end

  factory :seinfeld_first_episodes, class: 'Episode' do
    number 40
    association :season, factory: :seinfeld
  end

  factory :seinfeld_second_episodes, class: 'Episode' do
    number 30
    association :season, factory: :seinfeld
  end

  factory :seinfeld_third_episodes, class: 'Episode' do
    number 25
    association :season, factory: :seinfeld
  end

  factory :seinfeld_fourth_episodes, class: 'Episode' do
    number 36
    association :season, factory: :seinfeld
  end

  factory :lost_first_episodes, class: 'Episode' do
    number 80
    association :season, factory: :lost
  end

  factory :lost_second_episodes, class: 'Episode' do
    number 50
    association :season, factory: :lost
  end
end
