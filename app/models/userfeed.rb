class Userfeed < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed

  validates_associated :user
  validates_associated :feed
end
