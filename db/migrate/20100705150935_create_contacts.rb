class CreateContacts < ActiveRecord::Migration

  def self.up
    create_table :contacts do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.text :message, :null => false
      t.string :ip_address, :null => false
      t.string :browser, :null => false
      t.boolean :email_sent
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end

end
