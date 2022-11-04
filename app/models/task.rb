class Task < ApplicationRecord
  validates :project_id, presence: true
  validates :hour, presence: true
  validates :hour, numericality: true
  
  belongs_to :project
  
end
