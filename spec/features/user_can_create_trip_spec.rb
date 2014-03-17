require "spec_helper"
describe "creating a trip" do
  
  it "creates a new trip" do
    visit "/trips/new"
    within (".new-trip") do
      fill_in "Name", with: "Thailand booze cruise"
    end
    click_button "Create trip!"
    expect(page).to have_content "Thailand booze cruise"
  end
end