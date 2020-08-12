module ProjectsHelper
  def project_savings_amount_sum(project)
    project.savings.sum(:amount)
  end

  def percentage_completed(project)
    (project_savings_amount_sum(project) / project.goal) * 100
  end

  def goal_completed(project)
    (project_savings_amount_sum(Project.find(project[:id])) / Project.find(project[:id]).goal) * 100
  end
end
