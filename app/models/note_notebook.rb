class NoteNotebook < ActiveRecord::Base
    belongs_to :notebook
    belongs_to :note

    def self.find_by_note (id)
        self.all.find {|note| note.note_id == id}
    end

    def self.find_by_notebook (id)
        self.all.find {|notebook| notebook.notebook_id == id}
    end
end
  