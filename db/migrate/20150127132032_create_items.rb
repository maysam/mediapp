class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :link
      t.references :user, index: true

      t.timestamps
    end
  end
end
