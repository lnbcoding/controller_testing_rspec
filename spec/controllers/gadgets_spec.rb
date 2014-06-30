require 'spec_helper'

describe 'GET /gadgets' do
  it "should display all gadgets"
end

describe 'POST /gadgets' do
  context "when the request has valid paramters" do
    it "creates a new gadget"
    it "redirects the user to the /gadgets route"
  end
  
  context "when the request does not include a body value" do
    it "does not create a new gadget"
    it "returns a status code of 422"
  end

  context "when the request does not include a unique name value" do
    it "does not create a new gadget"
    it "returns a status code of 422"
  end
end
