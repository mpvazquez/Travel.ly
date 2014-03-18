require 'spec_helper'

describe "user can visit a place page" do
  
  it "shows place information to the user" do
    @place = FactoryGirl.create(:place)
    visit place_path(@place)
    expect(page).to have_content(@place.city)
    expect(page).to have_content(@place.description)
    expect(page).to have_selector("img")
  end

end