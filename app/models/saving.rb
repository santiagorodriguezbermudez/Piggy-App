class Saving < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :project, optional: true

  validates :name, :amount, presence: true
  validates :name, length: { minimum: 5 }
  validates :amount, numericality: { greater_than_or_equal_to: 1 }
end
