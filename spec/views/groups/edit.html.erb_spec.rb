require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :event_id => 1,
      :tag_id => 1
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input#group_event_id[name=?]", "group[event_id]"

      assert_select "input#group_tag_id[name=?]", "group[tag_id]"
    end
  end
end
