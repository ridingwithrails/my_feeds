class AddFieldsToVideo < ActiveRecord::Migration
  def change
    self.transaction do
      add_column :videos, :title, :string
      add_column :videos, :duration, :string
      add_column :videos, :thumbnail, :string
      add_column :videos, :description, :text
      add_column :videos, :rating, :string
    end
  end
end
