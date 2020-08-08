class ProjectsController < ApplicationController
  def index
    @user_projects = current_user.projects.ordered_by_name.pluck(:name, :goal, :created_at, :id)
    @other_projects = Project.rest_of_projects(current_user.id).pluck(:name, :goal, :created_at, :id)
  end

  def show
    @project = Project.find(params[:id])
    @savings = @project.savings.ordered_by_date_savings.includes(:author).pluck(:name, :amount, :created_at, 'users.name')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.image_url = project.image.url

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "The Project #{@project.name} was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :image, :goal)
  end

end
