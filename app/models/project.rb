class Project < ApplicationRecord
  has_many :savings
  belongs_to :user

  validates :name, :icon, presence: true
  validates :name, length: { minimum: 5 }
  validates :goal, numericality: { greater_than_or_equal_to: 1 }
end
