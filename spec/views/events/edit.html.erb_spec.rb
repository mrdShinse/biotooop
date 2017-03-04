require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :type => 1,
      :area => "MyString",
      :meeting_place => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_type[name=?]", "event[type]"

      assert_select "input#event_area[name=?]", "event[area]"

      assert_select "input#event_meeting_place[name=?]", "event[meeting_place]"
    end
  end
end
