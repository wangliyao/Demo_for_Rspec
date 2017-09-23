require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'is vaild with a name,password and code' do
    user = User.new(
        name: '122344',
        password: '332',
        code: '3322'
    )
    expect(user).to be_valid
  end

  it 'is vaild without name' do
    expect(FactoryGirl.build(:user, name: nil)).to_not have(1).errors_on(:name)
  end

  it 'is vaild with a duplicate name' do
    User.create(
        name: '123456', code: '2345'
    )
    user = User.new(
        name: '123456', code: '3221'
    )
    expect(user).to have(1).errors_on(:name)
  end

  it 'user factroy' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

end
