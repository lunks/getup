require 'spec/spec_helper'

describe Person do
  it { should belong_to(:postcode) }
end
