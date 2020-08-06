module SavingsHelper
  def get_project_name
    Project.all.pluck(:name).flatten
  end
end
