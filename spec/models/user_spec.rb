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

  before(:each) do
    User.delete_all
    @user = User.create({
      first_name: 'foo',
      last_name: 'bar',
      username: 'foobar',
      role: 'admin',
      email: 'foo@bar.com',
      password: 'secret',
    })
  end

  it 'has a valid email address' do
    expect(@user.email).to eq 'foo@bar.com'
  end

  it 'has a role of admin' do
    expect(@user.role).to eq 'admin'
  end

  it 'has a unique username' do
    expect(@user.username).to eq 'foobar'
  end

  it 'digests the password' do
    expect(@user.password_digest).to_not be_nil
  end

  it 'has a token generated from a password digest' do
    expect(@user.token).to_not be_nil
  end
end
