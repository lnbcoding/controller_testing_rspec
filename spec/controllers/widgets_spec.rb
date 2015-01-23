require 'spec_helper'

describe 'GET /widgets' do
  context "when a user is not logged in" do
    before(:each) do
      Widget.delete_all
    end

    it "displays all widgets" do
      5.times { Widget.create(title: "title: " + rand(1..5).to_s, content: "content: " + rand(1..5).to_s) }
      get '/widgets'
      expect(Widget.count).to eq(5)
      expect(last_response.body).to include("<h2>Widgets</h2>")
    end
  end

  context "when a user is logged in" do
    let(:user1) { User.create(username: "dirk", password: "nowizki") }
    let(:user2) { User.create(username: "phillip", password: "ivey") }

    before(:each) do
      Widget.delete_all
      user1.widgets << Widget.create(title: "nba", content: "power forward")
      user1.widgets << Widget.create(title: "dallas", content: "mavericks player")
      user2.widgets << Widget.create(title: "poker", content: "dice")
      user2.widgets << Widget.create(title: "craps", content: "and blackjack")

      # go to  '/widgets' route, 2nd arg is required
      # so we have to pass empty hash or nil, 3rd arg is the fake session
      get '/widgets', {}, { "rack.session" => { user_id: (user1.id) } }
    end

    it "displays all of the given user's widgets" do
      expect(last_response.body).to include("nba") && include("dallas")
    end

    it "does not display other users' widgets" do
      expect(last_response.body).not_to include("poker") && include("blackjack")
    end
  end
end
