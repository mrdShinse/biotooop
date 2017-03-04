require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :type => 2,
        :area => "Area",
        :meeting_place => "Meeting Place"
      ),
      Event.create!(
        :type => 2,
        :area => "Area",
        :meeting_place => "Meeting Place"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting Place".to_s, :count => 2
  end
end
