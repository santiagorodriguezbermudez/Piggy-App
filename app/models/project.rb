class Project < ApplicationRecord
  has_many :savings
  belongs_to :user

  validates :name, :goal, presence: true
  validates :name, length: { minimum: 5, maximum: 200 }
  validates :goal, numericality: { greater_than_or_equal_to: 1 }

  has_attached_file :image, styles: { medium: '300x300#', thumb: '100x100#' }, default_url: 'user.svg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  scope :ordered_by_name, -> { order(name: :asc) }
  scope :rest_of_projects, ->(user_id) { where.not('user_id=?', user_id).ordered_by_name }


  def self.get_savings(project)
    savings = project.savings.ordered_by_date_savings.includes(:author)
    savings = pluck_to_hash(savings.pluck(:name, :amount, :created_at, 'users.name', 'users.image_url'))
  end

  def self.user_projects(user)
    pluck_to_hash(user.projects.ordered_by_name.pluck(:name, :goal, :created_at, :id, :image_url))
  end

  def self.other_projects(user)
    pluck_to_hash(Project.rest_of_projects(user.id).pluck(:name, :goal, :created_at, :id, :image_url))
  end

  private

  def self.pluck_to_hash(pluck)
    pluck.map! { |s| { name: s[0], goal: s[1], date: s[2].strftime('%b-%d-%Y'), id: s[3], img: s[4] } }
  end

end
