class Notebook < ActiveRecord::Base
   belongs_to :user
   has_many :note_notebooks
   has_many :notes, through: :note_notebooks

   def updated_at_local
    self.updated_at.localtime.strftime("%D at %I:%M %p ")
   end

   def most_recent_note_update
    self.notes.order("updated_at DESC").first.updated_at_local
   end
end