require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :title => "Title",
        :link => "Link",
        :user => nil
      ),
      Item.create!(
        :title => "Title",
        :link => "Link",
        :user => nil
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td>a", :text => "Link".to_s, :count => 2
  end
end
