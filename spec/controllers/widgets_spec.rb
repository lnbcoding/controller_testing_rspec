require 'spec_helper'

describe 'GET /widgets' do
  context "when a user is not logged in" do
    it "displays all widgets"
  end

  context "when a user is logged in" do
    it "displays all of the given user's widgets"
    it "does not display other users' widgets"
  end
end
