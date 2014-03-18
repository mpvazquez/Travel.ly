class AddTitleToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :title, :string
  end
end
