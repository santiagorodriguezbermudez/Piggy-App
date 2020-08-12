class Saving < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :project, optional: true

  validates :name, :amount, presence: true
  validates :name, length: { minimum: 5, maximum: 200 }
  validates :amount, numericality: { greater_than_or_equal_to: 1 }

  scope :ordered_by_date_savings, -> { order(created_at: :desc) }
  scope :savings_with_project, -> { where.not(project_id: nil).includes(:project).ordered_by_date_savings }
  scope :savings_with_no_project, -> { where(project_id: nil).ordered_by_date_savings }
  scope :saving_author, -> { includes(:author) }
end
