class AddStopIDtoEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :stop, index: true
  end
end
