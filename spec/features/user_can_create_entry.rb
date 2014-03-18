require 'spec_helper'

describe "user can create an entry" do 
  let(:place){FactoryGirl.create(:place)}
  let(:trip){FactoryGirl.create(:trip)}
  let(:stop){place: :place, trip: :trip}

  it "creates a new entry for a place" do

    visit new_stop_entry_path(place, trip, stop) 

    fill_in :title, with: "Sample Title"
    fill_in :text, with: "Sample text sample text"
    click_button :submit

    expect(page).to have_content "Sample Title"
    expect(page).to have_content "Sample text sample text"

  end
end
