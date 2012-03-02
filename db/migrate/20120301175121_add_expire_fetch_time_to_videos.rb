class AddExpireFetchTimeToVideos < ActiveRecord::Migration
  def change
    self.transaction do
      add_column :videos, :expire_at, :datetime
    end
  end
end
