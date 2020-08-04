class User < ApplicationRecord
  has_many :projects
  has_many :savings, foreign_key: :author_id, class_name: 'Saving'

  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: true
end
