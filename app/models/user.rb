class User < ApplicationRecord
  has_many :projects
  has_many :savings, foreign_key: :author_id, class_name: 'Saving'

  has_secure_password
  has_attached_file :image, styles: { medium: '300x300#', thumb: '100x100#' }, default_url: 'user.svg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :name, presence: true, length: { minimum: 5, maximum: 200 }, uniqueness: true
end
