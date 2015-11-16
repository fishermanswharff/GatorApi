require 'rails_helper'

RSpec.describe Feed, type: :model do

  let(:feed) { FactoryGirl.create(:feed) }
  let(:bad_feed) { FactoryGirl.create(:feed, :improper_url) }
  let(:user) { FactoryGirl.create(:user) }

  it 'is an instance of a feed' do
    expect(feed).to be_a Feed
  end

  it 'validates the feed contents' do
    expect(feed).to be_valid
  end

  it 'gets the title from the feed' do
    expect(feed.title).not_to be_nil
  end

  it 'gets the description from the feed' do
    expect(feed.description).not_to be_nil
  end

  it 'gets the feed_type from the feed' do
    expect(feed.feed_type).not_to be_nil
  end

  it 'gets the feed_version from the feed' do
    expect(feed.feed_version).not_to be_nil
  end

  it 'gets the feed encoding from the feed' do
    expect(feed.encoding).not_to be_nil
  end

  it 'has users through userfeeds' do
    expect{ feed.users << user }.to change{Userfeed.count}.from(0).to(1)
  end

  it 'will not save the record if the url cannot be parsed as rss' do
    expect{ bad_feed.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

end
