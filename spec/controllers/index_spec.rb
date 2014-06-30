require 'spec_helper'

describe 'GET /gadgets' do
  it "should display all widgets" do; end
end

describe 'POST /gadgets' do
  it "should create a new gadget" do; end
  it "should redirect the user to the /gadgets route" do; end
  
  describe "if the new gadget does not have a name" do
    it "should not create a new gadget" do; end
    it "should return a status code of 422" do; end
  end

  describe "if the new gadget would not be unique" do
    it "should not create a new gadget" do; end
    it "should return a status code of 422" do; end
  end
end

describe 'GET /widgets' do
  describe "when a user is not logged in" do
    it "should display all widgets" do; end
  end

  describe "when a user is logged in" do
    it "should display all of the given user's widgets" do; end
    it "should not display other users' widgets" do; end
  end
end

