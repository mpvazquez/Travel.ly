require 'spec_helper'

describe Trip do
  it { should validate_presence_of(:name) }
  it { should have_many(:stops) }
end
