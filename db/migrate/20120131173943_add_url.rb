class AddUrl < ActiveRecord::Migration
  def up
    create_table :urls, :force => true do |t|
      t.string :url
      t.string :topic
      t.string :notes
      t.timestamps
    end
  end

  def down
    drop_table :url
  end
end