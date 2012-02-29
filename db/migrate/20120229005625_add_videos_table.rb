class AddVideosTable < ActiveRecord::Migration
  def up
    self.transaction do
      create_table :videos do |t|
        t.string :youtube_id
      end
    end
  end

  def down
    self.transaction do
      remove_table :videos
    end
  end
end
