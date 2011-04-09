require 'spec_helper'

describe Postcode do
  it { should have_many(:people) }
end
