require "rails_helper"

describe "User log in and logs out" do
  it "user fills out correct credentials to log in" do
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

    it "clicks log out and successfully logs out" do
      user = create(:user)
      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      click_on "Log In"

      visit root_path
      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Register')
      expect(page).to have_content("Login")
    end
end
