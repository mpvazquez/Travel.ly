require "spec_helper"

describe "user can see journal entries related to a stop" do

  it "shows all the journal entries related to a stop" do
    @stop = FactoryGirl.create(:stop)
    visit stop_path(@stop)
    expect(page).to have_content(@stop.place.city)
    expect(page).to have_content(@)
  end

end