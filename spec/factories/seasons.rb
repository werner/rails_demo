FactoryGirl.define do
  factory :dragon_ball, class: 'Season' do
    id 1
    title 'Dragon Ball'
    plot  'Follows the adventures of an extraordinarily strong young ' +
          'boy named Goku as he searches for the seven dragon balls. '
    created_at '2014-01-10 00:00:00'
    initialize_with { Season.find_or_create_by(id: id)}
  end

  factory :seinfeld, class: 'Season' do
    id 2
    title 'Seinfeld'
    plot 'The continuing misadventures of neurotic New York stand-up ' +
         'comedian Jerry Seinfeld and his equally neurotic New York friends.'
    created_at '2015-01-10 00:00:00'
    initialize_with { Season.find_or_create_by(id: id)}
  end

  factory :lost, class: 'Season' do
    id 3
    title 'Lost'
    plot 'The survivors of a plane crash are forced to work together ' +
         'in order to survive on a seemingly deserted tropical island.'
    created_at '2014-11-10 00:00:00'
    initialize_with { Season.find_or_create_by(id: id)}
  end
end
