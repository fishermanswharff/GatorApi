require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:user)).to be_valid
  end

  it 'has a valid email address' do
    user = FactoryGirl.build_stubbed(:user)
    expect(user.email).to eq 'fishermanswharff@mac.com'
  end

  it 'has a role' do
    user = FactoryGirl.build_stubbed(:user)
    expect(user.role).to eq 'generic'
  end

  it 'has a token generated from a password digest' do
    user = FactoryGirl.build_stubbed(:user)
    expect(user.token).to_not be_nil
  end

end
