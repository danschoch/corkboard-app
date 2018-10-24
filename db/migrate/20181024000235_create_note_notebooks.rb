class CreateNoteNotebooks < ActiveRecord::Migration
  def change
    create_table :note_notebooks do |t|
      t.integer :note_id
      t.integer :notebook_id
    end
  end
end
