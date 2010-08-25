class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.string :image_url
      t.string :name
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
