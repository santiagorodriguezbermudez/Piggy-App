module ApplicationHelper
  def no_navbar
    current_page?(controller: 'sessions', action: 'welcome') || current_page?(controller: 'users', action: 'show')
  end

  def left_icon
    back_arrow = (link_to "<i class='fas fa-arrow-left'></i>".html_safe, left_icon_action).html_safe
    menu = (link_to "<i class='fas fa-bars'></i>".html_safe, root_url).html_safe

    controller.action_name == 'new' || controller.action_name == 'show' ? back_arrow : menu
  end

  def left_icon_action
    case controller.controller_name
    when 'sessions'
      welcome_path
    when 'users'
      welcome_path
    when 'savings'
      savings_path
    when 'projects'
      projects_path
    else
      root_path
    end
  end

  def message_if_no_projects(item)
    return unless item.empty?

    "<div class='d-flex justify-content-between my-3 bg-white rounded p-5 shadow'>\
    <p>No items yet</p>\
    </div>".html_safe
  end

  def render_img(item)
    html_img = (image_tag item[:img], class: 'profile text-white').html_safe
    html_link = (link_to html_img, project_path(id: item[:id]), class: 'p-5').html_safe
    return html_link unless item[:img].nil?
  end
end
