class Project < ApplicationRecord
  has_many :savings
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :goal, numericality: { greater_than_or_equal_to: 1 }

  has_attached_file :image, styles: { medium: '300x300#', thumb: '100x100#' }, default_url: 'test.svg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  scope :ordered_by_name, -> { order(name: :desc)}
  scope :rest_of_projects, -> (user_id) { where.not("user_id=?", user_id).ordered_by_name }
  
end
