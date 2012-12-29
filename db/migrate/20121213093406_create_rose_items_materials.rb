class CreateRoseItemsMaterials < ActiveRecord::Migration
  def change
    create_table :rose_items_materials do |t|

      t.string :name, :default => "", :null => false
      t.integer :use_Limit
      t.integer :item_type_id
      t.integer :price
      t.integer :price_fluctuation_rate
      t.integer :weight
      t.integer :quality
      t.integer :icon_number
      t.integer :field_number
      t.integer :sound_fx
      t.integer :crafting_number
      t.integer :crafting_level
      t.integer :crafting_material
      t.integer :crafting_difficulty
      t.integer :crafting_requiered_item_type
      t.integer :bullet_type
      t.integer :refine_bonus
      t.string :item_description

      t.timestamps
    end
  end
end
