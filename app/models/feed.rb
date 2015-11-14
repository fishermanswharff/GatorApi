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

class Feed < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, :description, presence: true
  validates_associated :user
end
