require "rails_helper"

describe "User can create a restaurant", :js => true do
  it "user fills out correct credentials to log in" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    expect(page).to have_content('Create Restaurant')

    fill_in "name", :with => "Carlos Bakery"
    fill_in "cuisine", :with => "Pastries"
    fill_in "city", :with => "Hoboken"
    fill_in "state", :with => "NJ"
    fill_in "zip", :with => "07030"

    expect(current_path).to eq(root_path)
    expect(Restaurant.creator).to eq(user)
    expect(Restaurant.name).to eq("Carlos Bakery")
    expect(Restaurant.cuisine).to eq("Pastries")
    expect(Restaurant.city).to eq("Hoboken")
    expect(Restaurant.state).to eq("NJ")
    expect(Restaurant.zip).to eq("07030")
  end
end
