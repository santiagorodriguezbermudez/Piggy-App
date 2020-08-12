class ProjectsController < ApplicationController
  def index
    @user_projects = Project.user_projects(current_user)
    @other_projects = Project.other_projects(current_user)
  end

  def show
    @project = Project.find(params[:id])
    @savings = Project.get_savings(@project)
    @total_savings = @project.savings.sum(:amount)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        @project.update(image_url: @project.image.url)
        format.html { redirect_to projects_path, notice: "The project #{@project.name} was created." }
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
