class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :tld, :null => false, :default => "", :limit => 2
      t.string :name, :null => false, :default => "", :limit => 64
    end
  end
end