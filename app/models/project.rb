class Project < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :target_time, presence: true
  
  belongs_to :user
end
