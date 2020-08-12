module SavingsHelper
  def no_projects?
    Project.all.pluck(:name).flatten.empty?
  end

  def display_projects
    collection_select(:saving, :project_id, Project.all, :id, :name, prompt: true).html_safe
  end

  def show_projects
    projects = Project.all.pluck(:name).flatten
    if projects.empty?
      (link_to 'Add the first Project', root_path, class: 'border-white w-100 rounded mb-0 py-4 pl-5 my-3').html_safe
    else
      collection_select(:saving, :project_id, Project.all, :id, :name, prompt: true).html_safe
    end
  end

  def render_saving_img(item)
    (image_tag item[:img], class: 'profile text-white').html_safe unless item[:img].nil?
  end
end
