class AddFrequencyToVocentry < ActiveRecord::Migration
  def self.up
    add_column :vocentries, :frequency, :integer, :default => 1
  end

  def self.down
    remove_column :vocentries, :frequency
  end
end
