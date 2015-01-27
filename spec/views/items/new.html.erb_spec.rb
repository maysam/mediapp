require 'rails_helper'

RSpec.describe "items/new", :type => :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :link => "MyString",
      :user => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_link[name=?]", "item[link]"
    end
  end
end
