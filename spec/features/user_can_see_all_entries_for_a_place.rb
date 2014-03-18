require "spec_helper"

describe "user can see journal entries related to a place" do

  it "shows all the journal entries related to a place" do
    @place = FactoryGirl.create(:place)
    @stop = FactoryGirl.create(:stop, place_id: @place.id)
    @other_stop = FactoryGirl.create(:stop, place_id: @place.id)
    @entry = FactoryGirl.create(:entry, stop_id: @stop.id)
    @not_entry = FactoryGirl.create(:entry, text: "THIS SHOULDN'T SHOW UP", stop_id: @other_stop.id)
    visit place_path(@place)
    expect(page).to have_content(@place.city)
    expect(page).to have_content(@entry.text)
    expect(page).to have_content(@entry.title)
    expect(page).to have_content(@not_entry.text)

  end

end