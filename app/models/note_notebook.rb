class NoteNotebook < ActiveRecord::Base
    belongs_to :notebook
    belongs_to :note
end
  