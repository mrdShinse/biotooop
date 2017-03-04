require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :type => 2,
      :area => "Area",
      :meeting_place => "Meeting Place"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/Meeting Place/)
  end
end
