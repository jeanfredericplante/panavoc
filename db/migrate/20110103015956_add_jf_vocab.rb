class AddJfVocab < ActiveRecord::Migration
  def self.up
    Vocentry.delete_all
    Vocentry.create(:eng_word => "belated",
                    :frequency => "2")

  end

  def self.down
    Vocentry.delete_all
  end
end
