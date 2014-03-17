require 'spec_helper'

describe Stop do
  it { should belong_to(:place) }
  it { should validate_presence_of(:place) }
  it { should belong_to(:trip) }
  it { should validate_presence_of(:trip) }
end