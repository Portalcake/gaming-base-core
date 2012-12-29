# This migration comes from ragnarok2 (originally 20121226092253)
class CreateRagnarok2TranslationsCitizenNames < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_citizen_names do |t|

      t.integer :citizen_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end

    add_index :ragnarok2_translations_citizen_names, :citizen_id, :unique => true, :name => :cid
  end
end
