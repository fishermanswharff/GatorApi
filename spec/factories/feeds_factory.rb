FactoryGirl.define do
  factory :feed do
    url 'http://rss.cnn.com/rss/cnn_topstories.rss'

    trait :improper_url do
      url 'http://www.google.com'
    end
  end
end
