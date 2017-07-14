require "rails_helper"

describe "User registration" do
  it "visitor clicks on registration link and is redirected to the registration form" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(new_user_path)
  end
  it "visitor fills in account info and successfully creates an account" do
    visit new_user_path
    fill_in "user[email]", with: "bschwartz"
    fill_in "user[password]", with: "brett"
    click_on "Create Account"

    expect(User.first.email).to eq("bschwartz")
    expect(current_path).to eq(root_path)
  end
  it "visitor incorrectly fills in account info and doesn't create account" do
    visit new_user_path
    fill_in "user[email]", with: "bschwartz"
    click_on "Create Account"

    expect(page).to have_content("Account Not Created")
    expect(current_path).to eq(new_user_path)
  end
  it "user should not see register link if they are logged in but should see a welcome message" do
    user = create (:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to_not have_content("Register")
    expect(page).to have_content("Welcome bschwartz")
  end
end
