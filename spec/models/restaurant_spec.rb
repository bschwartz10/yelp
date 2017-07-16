require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before(:each) do
    @user = User.create(
      email: 'brett',
      password: '123'
    )
    @restaurant = Restaurant.create(
      name: 'Carlos Bakery',
      cuisine: 'Pastries',
      city: 'Hoboken',
      state: 'NJ',
      zip: '07030',
      user: @user
    )
  end

  it "is valid with valid attributes" do
    expect(@restaurant.name).to eq("Carlos Bakery")
    expect(@restaurant.cuisine).to eq("Pastries")
    expect(@restaurant.city).to eq("Hoboken")
    expect(@restaurant.state).to eq("NJ")
    expect(@restaurant.zip).to eq("07030")
    expect(@restaurant).to be_valid
  end

# RSpec.describe User, type: :model do
#   it "is valid with valid attributes" do
#     user = create(:user)
#
#     expect(user.email).to eq("bschwartz")
#     expect(user.password).to be_truthy
#     expect(user).to be_valid
#   end
#
#   it "is invalid without a email" do
#     user = User.create(password: "brett")
#
#     expect(user).to_not be_valid
#   end
#   it "emails must be unique" do
#     User.create(email: "brett")
#     user2 = User.create(email: "brett")
#
#     expect(user2).to_not be_valid
#   end
#   it "is invalid without a password" do
#     user = User.create(email: "bschwartz")
#
#     expect(user).to_not be_valid
#   end
end
