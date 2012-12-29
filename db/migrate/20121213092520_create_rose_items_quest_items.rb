class CreateRoseItemsQuestItems < ActiveRecord::Migration
  def change
    create_table :rose_items_quest_items do |t|

      t.string :name, :default => "", :null => false
      t.integer :item_type_id
      t.integer :icon_number
      t.integer :quest_image
      t.string :quest_id
      t.string :item_description

      t.timestamps
    end
  end
end
