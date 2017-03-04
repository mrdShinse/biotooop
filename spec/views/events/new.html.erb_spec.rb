require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :type => 1,
      :area => "MyString",
      :meeting_place => "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_type[name=?]", "event[type]"

      assert_select "input#event_area[name=?]", "event[area]"

      assert_select "input#event_meeting_place[name=?]", "event[meeting_place]"
    end
  end
end
