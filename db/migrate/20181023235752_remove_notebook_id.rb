class RemoveNotebookId < ActiveRecord::Migration
  def change
    remove_column :notes, :notebook_id
  end
end
