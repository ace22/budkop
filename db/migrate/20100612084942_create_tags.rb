class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.belongs_to :worker
      t.string :name
      t.string :url
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :tags
  end
end
