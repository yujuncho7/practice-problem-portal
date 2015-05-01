require 'spec_helper'

describe Instructors::SessionsController do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:instructor]
  end
  it "should be possible to login" do
    get :new
  end
  it "should be possible to create" do
    post :create
  end
end

