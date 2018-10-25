class Note < ActiveRecord::Base
    belongs_to :user
    has_many :note_notebooks
    has_many :notebooks, through: :note_notebooks
    
    def updated_at_local
      self.updated_at.localtime.strftime("%D at %I:%M %p ")
    end
end