class Note < ActiveRecord::Base
    has_many :note_notebooks
    has_many :notebooks, through: :note_notebooks
end