class Project < ApplicationRecord
  has_many :savings
  belongs_to :user

  validates :name, :icon, presence: true
  validates :name, length: { minimum: 5 }
  validates :goal, numericality: { greater_than_or_equal_to: 1 }

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
