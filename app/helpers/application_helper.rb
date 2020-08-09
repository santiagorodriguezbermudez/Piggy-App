module ApplicationHelper
  def no_navbar
    current_page?(controller: 'sessions', action: 'welcome') || current_page?(controller: 'users', action: 'show')
  end

  def left_icon

    back_arrow = (link_to "<i class='fas fa-arrow-left'></i>".html_safe, left_icon_action).html_safe
    menu = (link_to "<i class='fas fa-bars'></i>".html_safe, root_url ).html_safe

    (controller.action_name == 'new' || controller.action_name == 'show') ? back_arrow : menu 
  
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

end
