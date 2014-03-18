class AddTextToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :text, :text
  end
end
