require 'spec_helper'

describe 'GET /gadgets' do
  it "displays all gadgets" do
    Gadget.delete_all
    Gadget.create(name: "time_machine", body: "go back in time")
    get '/gadgets'
    expect(Gadget.last.name).to include("time_machine")
    expect(last_response.body).to include("<h2>All Gadgets</h2>")
  end
end

describe 'POST /gadgets' do
  context "when the request has valid parameters" do
    before(:each) do
      Gadget.delete_all
      post '/gadgets', { name: "time_machine", body: "go back in time" }
    end

    it "creates a new gadget" do
      expect(Gadget.last.name).to include("time_machine")
      expect(Gadget.count).to eq(1)
    end

    it "redirects the user to the /gadgets route" do
      expect(last_response.redirect?).to be_true
      follow_redirect!
      expect(last_request.url).to eq("http://example.org/gadgets")
    end
  end

  context "when the request does not include a body value" do
    before(:each) do
      Gadget.delete_all
      post '/gadgets', { name: "time_machine" }
    end

    it "does not create a new gadget" do
      expect(Gadget.count).to eq(0)
    end

    it "returns a status code of 422" do
      expect(last_response.status).to eq(422)
    end
  end

  context "when the request does not include a unique name value" do
    before(:each) do
      Gadget.delete_all
      post '/gadgets', { name: "time_machine", body: "go back in time" }
      post '/gadgets', { name: "time_machine", body: "in 1990 go farther back" }
    end

    it "does not create a new gadget" do
      # Only the first post will be inserted since the 2nd one has a dupe name
      expect(Gadget.count).to eq(1)
      expect(Gadget.last.body).to include("go back in time")
    end

    it "returns a status code of 422" do
      expect(last_response.status).to eq(422)
    end
  end
end
