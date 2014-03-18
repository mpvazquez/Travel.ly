require "spec_helper"

describe "user can see journal entries related to a stop" do

  it "shows all the journal entries related to a stop" do
    @stop = FactoryGirl.create(:stop)
    @entry = FactoryGirl.create(:entry, stop_id: @stop.id)
    @not_entry = FactoryGirl.create(:entry, text: "THIS SHOULDN'T SHOW UP")

    visit stop_path(@stop)
    expect(page).to have_content(@stop.place.city)
    expect(page).to have_content(@entry.text)
    expect(page).to have_content(@entry.title)
    expect(page).not_to have_content(@not_entry.text)

  end

end