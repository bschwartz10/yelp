require "rails_helper"

describe "User log in" do
  it "visitor clicks on registration link and is redirected to the registration form" do
    user = create(:user)
    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome bschwartz")
  end
end
