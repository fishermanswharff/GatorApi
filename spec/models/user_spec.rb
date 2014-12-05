require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(
      { 
        first_name: 'Jason',
        last_name: 'Wharff',
        username: 'jasonwharff',
        role: 'admin',
        email: 'fishermanswharff@mac.com',
        password_digest: '$2a$10$iUY.xKqExZ7DhaWVAAh5Q.o/gfUDR5I7iHTp2Y46nmrogYIV504X6',
      }
    )
  end

  it 'has a valid factory' do
    # the factory is not valid because it does not invoke the set_token method on a user
    expect(FactoryGirl.build_stubbed(:user)).to be_valid
  end

  it 'has a valid email address' do
    # user = FactoryGirl.build_stubbed(:user)
    expect(@user.email).to eq 'fishermanswharff@mac.com'
  end

  it 'has a role of admin' do
    # user = FactoryGirl.build_stubbed(:user)
    expect(@user.role).to eq 'admin'
  end

  it 'has a token generated from a password digest' do
    # user = FactoryGirl.build_stubbed(:user)
    expect(@user.token).to_not be_nil
  end
end
