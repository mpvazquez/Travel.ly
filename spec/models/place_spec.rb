require 'spec_helper'

describe Place do

	it { should have_many(:trips).through(:stops) }
	it { should have_many(:stops) }

	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:state) }
	it { should validate_presence_of(:country) }
	it { should validate_presence_of(:latitude) }
	it { should validate_presence_of(:longitude) }
	it { should validate_presence_of(:google_id) }
	it { should validate_presence_of(:photo_url) }
	it { should validate_presence_of(:description) }

end