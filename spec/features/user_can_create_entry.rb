require 'spec_helper'

describe "user can create an entry" do 
  let(:place){FactoryGirl.create(:place)}
  let(:trip){FactoryGirl.create(:trip)}
  let(:stop){Stop.create(place: place, trip: trip)}

  it "creates a new entry for a place" do

    visit new_stop_entry_path(stop.id) 

    fill_in("Title", :with => "Sample Title")
    fill_in("Text", with: "Sample text sample text")
    attach_file "entry_photo", "#{Rails.root}/spec/fixtures/sample.jpg"
    click_button "Create Entry"

    expect(page).to have_content "Sample Title"
    expect(page).to have_content "Sample text sample text"
  end
end