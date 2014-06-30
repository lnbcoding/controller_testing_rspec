require 'spec_helper'

describe 'GET /gadgets' do
  it "should display all widgets"
end

describe 'POST /gadgets' do
  it "creates a new gadget"
  it "redirects the user to the /gadgets route"
  
  context "when the new gadget does not have a body" do
    it "does not create a new gadget"
    it "returns a status code of 422"
  end

  context "when the new gadget would not be unique" do
    it "does not create a new gadget"
    it "returns a status code of 422"
  end
end

describe 'GET /widgets' do
  context "when a user is not logged in" do
    it "displays all widgets"
  end

  context "when a user is logged in" do
    it "displays all of the given user's widgets"
    it "does not display other users' widgets"
  end
end

