class AddPublicToItem < ActiveRecord::Migration
  def change
    add_column :items, :public, :boolean, default: false
  end
end
