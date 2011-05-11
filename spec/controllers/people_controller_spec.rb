require 'spec_helper'

describe PeopleController do
  it 'responds to a get request' do
    get :index
    response.should be_success
  end
end
