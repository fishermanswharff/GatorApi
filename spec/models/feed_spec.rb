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

  let(:feed) { FactoryGirl.create(:feed) }
  let(:bad_feed) { FactoryGirl.create(:feed, :improper_url) }

  it 'is an instance of a feed' do
    expect(feed).to be_a Feed
  end

end
