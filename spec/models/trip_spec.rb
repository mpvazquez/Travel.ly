require 'spec_helper'

describe Trip do
  it { should validate_presence_of(:name) }
end
