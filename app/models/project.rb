class Project < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :target_time, presence: true
  validates :target_time, numericality: true
  validates :level_of_achievement, numericality: true, allow_nil: true
  
  belongs_to :user
  has_many :tasks
end
