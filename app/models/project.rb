class Project < ApplicationRecord
  has_many :savings, dependant: destroy
  belongs_to :project_creator, class_name: 'User', foreign_key: :user_id

  validates :name, :icon, presence: true
  validates :name, length: { minimum: 5 }
  validates :goal, numericality: { greater_than_or_equal_to: 1 }
end
