module SavingsHelper
  def no_projects?
    Project.all.pluck(:name).flatten.empty?
  end
  
  def display_projects
    (collection_select(:saving, :project_id, Project.all, :id, :name, prompt: true).html_safe)
  end
end
