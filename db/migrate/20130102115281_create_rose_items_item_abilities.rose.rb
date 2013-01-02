# This migration comes from rose (originally 20121221125543)
class CreateRoseItemsItemAbilities < ActiveRecord::Migration
  def change
    create_table :rose_items_item_abilities do |t|

      t.references :item_attributable, :polymorphic => true
      t.references :ability, :default => 0, :null => false
      t.integer :value, :default => 0, :null => false
      t.boolean :required, :default => 0, :null => false

    end
    add_index :rose_items_item_abilities,
        [
          :item_attributable_type,
          :item_attributable_id,
          :ability_id,
          :required
        ],
        :unique => true, :name => :taa
    add_index :rose_items_item_abilities, :required
  end
end
