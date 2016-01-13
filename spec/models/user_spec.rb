# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  username               :string           not null
#  role                   :integer          default(1), not null
#  email                  :string           not null
#  password_digest        :string
#  token                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  it 'has a valid email address' do
    expect(user.email).to match /(?:[\w\d\S]+)@(?:[\w\d\-\.]){1,253}[\.](?:[\w]{2,4})/
  end

  it 'user has a generic role' do
    expect(user.role).to eq 'generic'
  end

  it 'admin has an admin role' do
    expect(admin.role).to eq 'admin'
  end

  it 'has a unique username' do
    expect(user.username).not_to be_nil
  end

  it 'digests the password' do
    expect(user.password_digest).not_to be_nil
  end

  it 'has a token generated from a password digest' do
    expect(user.token).not_to be_nil
    expect(user.token.length).to eq 32
  end

  it 'updates the sign_in_count when a user signs in' do
    expect{ user.increment_sign_in_count }.to change{ user.sign_in_count }.from(0).to(1)
  end

  it 'generates a uuid when a user needs to reset a password' do
    expect{ user.reset_password }.to change{ user.reset_password_token }
    expect(user.reset_password_token.length).to eq 32
  end

  it 'updates the timestamp when a user resets their password' do
    expect{ user.update_reset_password_ts }.to change{ user.reset_password_sent_at }
  end
end
