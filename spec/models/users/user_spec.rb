require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)

    expect(user.email).to eq("bschwartz")
    expect(user.password).to be_truthy
    expect(user).to be_valid
  end

  it "is invalid without a email" do
    user = User.create(password: "brett")

    expect(user).to_not be_valid
  end
  it "emails must be unique" do
    User.create(email: "brett")
    user2 = User.create(email: "brett")

    expect(user2).to_not be_valid
  end
  it "is invalid without a password" do
    user = User.create(email: "bschwartz")

    expect(user).to_not be_valid
  end
end
