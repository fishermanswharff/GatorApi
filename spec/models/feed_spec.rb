require 'rails_helper'

RSpec.describe Feed, type: :model do

  let(:rssfeed) { FactoryGirl.create(:feed, :rss_feed) }
  let(:atomfeed) { FactoryGirl.create(:feed, :atom_feed) }
  let(:bad_feed) { FactoryGirl.create(:feed, :improper_url) }
  let(:user) { FactoryGirl.create(:user) }

  it 'allows rss to be a Feed' do
    expect(rssfeed).to be_a Feed
  end

  it 'allows atom to be a Feed' do
    expect(atomfeed).to be_a Feed
  end

  it 'validates the feed contents' do
    expect(rssfeed).to be_valid
  end

  it 'has users through userfeeds' do
    expect{ rssfeed.users << user }.to change{ Userfeed.count }.from(0).to(1)
  end

  it 'will not save the record if the url cannot be parsed as rss' do
    expect{ bad_feed.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'delivers a feed parsed by nokogiri' do
    expect(rssfeed.data.class.to_s).to start_with 'Feedjira::Parser'
    expect(atomfeed.data.class.to_s).to start_with 'Feedjira::Parser'
  end

end
