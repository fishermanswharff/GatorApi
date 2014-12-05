require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has a valid factory' do
    expect(FactoryGirl.build_stubbed(:user)).to be_valid
  end

  it 'has a role' do

  end

  it 'can create an oauth profile' do

  end

end
