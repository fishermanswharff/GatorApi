FactoryGirl.define do
  factory :feed do
    title 'CNN.com - Top Stories' #{ Faker::Lorem.sentence(3, false, 4) }
    url 'http://rss.cnn.com/rss/cnn_topstories.rss'  #{ Faker::Internet.url('rss.cnn.com', '/rss/cnn_topstories.rss') }
    description 'Cras mattis consectetur purus sit amet fermentum. Etiam porta sem malesuada magna mollis euismod. Curabitur blandit tempus porttitor. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.' #{ Faker::Lorem.sentence(3, false, 4) }
    user

    trait :improper_url do
      url 'http://www.google.com'
    end
  end
end