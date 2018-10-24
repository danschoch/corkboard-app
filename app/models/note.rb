class Note < ActiveRecord::Base
    belongs_to :user
    has_many :note_notebooks
    has_many :notebooks, through: :note_notebooks
end