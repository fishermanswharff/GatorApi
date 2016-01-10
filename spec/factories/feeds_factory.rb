FactoryGirl.define do
  factory :feed do

    trait :rss_feed do
      url 'http://rss.cnn.com/rss/cnn_topstories.rss'
    end

    trait :atom_feed do
      url 'https://news.google.com/?output=atom'
    end

    trait :improper_url do
      url 'http://www.google.com'
    end
  end
end
