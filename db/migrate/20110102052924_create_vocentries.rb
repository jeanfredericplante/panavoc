class CreateVocentries < ActiveRecord::Migration
  def self.up
    create_table :vocentries do |t|
      t.string :eng_word
      t.text :eng_desc
      t.string :fr_word
      t.text :fr_desc
      t.string :sp_word
      t.text :sp_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :vocentries
  end
end
