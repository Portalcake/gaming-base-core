# This migration comes from rose (originally 20121213143321)
class CreateRoseQuests < ActiveRecord::Migration
  def change
    create_table :rose_quests do |t|

        t.string :name, :default => "", :null => false
        t.integer :time_limit
        t.integer :icon_number
        t.string :abandon_trigger
        t.integer :repeatable
        t.integer :daily_limit
        t.string :description_id

      t.timestamps
    end
  end
end
