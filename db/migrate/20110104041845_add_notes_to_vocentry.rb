class AddNotesToVocentry < ActiveRecord::Migration
  def self.up
    add_column :vocentries, :notes, :text
  end

  def self.down
    remove_column :vocentries, :notes
  end
end
