class AddTimeStampsToVideoTable < ActiveRecord::Migration
  def change
    self.transaction do
      add_column :videos, :created_at, :timestamp
      add_column :videos, :updated_at, :timestamp
    end
  end
end
