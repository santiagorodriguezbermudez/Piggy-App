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

  def message_if_no_projects(projects)
    if projects.empty? 
      "<div class='d-flex justify-content-between my-3 bg-white rounded p-5 shadow'>\
      <p>No projects registered</p>\
      </div>".html_safe
    end
  end

  def render_img(project)
    unless project[:img].nil?
      (link_to (image_tag project[:img], class:'profile text-white').html_safe, project_path(id: project[:id]), class:'p-5').html_safe
    end
  end
end
