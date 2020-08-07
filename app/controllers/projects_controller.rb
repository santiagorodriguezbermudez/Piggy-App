class ProjectsController < ApplicationController
  def index
    @user_projects = current_user.projects.ordered_by_name.pluck(:name, :goal, :created_at)
    @other_projects = Project.rest_of_projects(current_user.id).pluck(:name, :goal, :created_at)
  end

  def show
  end

  def new
  end

  def create
  end

end
