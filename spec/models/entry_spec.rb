require 'spec_helper'

describe Entry do
  it { should belong_to(:stop) }
  it { should validate_presence_of(:stop) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
end