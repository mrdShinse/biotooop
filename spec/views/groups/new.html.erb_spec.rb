require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :event_id => 1,
      :tag_id => 1
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_event_id[name=?]", "group[event_id]"

      assert_select "input#group_tag_id[name=?]", "group[tag_id]"
    end
  end
end
