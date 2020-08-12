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

  protected

  def self.return_savings(user_savings, action = 'all')
    savings = action == 'other' ? user_savings.savings_with_no_project : user_savings.savings_with_project
  
    savings = savings.includes(:project).pluck(:name, :amount, :created_at, 'projects.image_url', :project_id)
    savings.map { |s| { name: s[0], amount: s[1], date: s[2].strftime('%b-%d-%Y'), img: s[3], project: s[4] } }

  end


end
