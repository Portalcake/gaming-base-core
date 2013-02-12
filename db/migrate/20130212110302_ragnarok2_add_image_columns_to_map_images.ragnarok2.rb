# This migration comes from ragnarok2 (originally 20130212103120)
class Ragnarok2AddImageColumnsToMapImages < ActiveRecord::Migration
  def up
    add_attachment :ragnarok2_map_images, :image
  end

  def down
    remove_attachment :ragnarok2_map_images, :image
  end
end
