# == Schema Information
#
# Table name: feeds
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  url         :string           not null
#  description :text             not null
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Feed, type: :model do

  before :each do
    # @user = FactoryGirl.create(:user)
    @good_feed = FactoryGirl.create(:feed)
    # @bad_feed = FactoryGirl.create(:feed, :improper_url)
  end

  it 'is an instance of a feed' do
    expect(@good_feed).to be_a Feed
  end
end
