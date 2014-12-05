require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    User.delete_all
    @user = User.create(
      { 
        first_name: 'foo',
        last_name: 'bar',
        username: 'foobar',
        role: 'admin',
        email: 'foo@bar.com',
        password: 'secret',
      }
    )
  end

  it 'has a valid email address' do
    expect(@user.email).to eq 'foo@bar.com'
  end

  it 'has a role of admin' do
    expect(@user.role).to eq 'admin'
  end

  it 'has digests the password' do
    expect(@user.password_digest).to_not be_nil
  end

  it 'has a token generated from a password digest' do
    expect(@user.token).to_not be_nil
  end
end
