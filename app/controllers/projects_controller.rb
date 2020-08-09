class ProjectsController < ApplicationController
  def index
    @user_projects = pluck_to_hash(current_user.projects.ordered_by_name.pluck(:name, :goal, :created_at, :id, :image_url))
    @other_projects = pluck_to_hash(Project.rest_of_projects(current_user.id).pluck(:name, :goal, :created_at, :id, :image_url))
  end

  def show
    @project = Project.find(params[:id])
    @savings = @project.savings.ordered_by_date_savings.includes(:author)
    @savings = pluck_to_hash(@savings.pluck(:name, :amount, :created_at, 'users.name', 'users.image_url'))
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

  def pluck_to_hash(pluck)
    pluck.map! {|s| {name: s[0], goal: s[1], date: s[2].strftime("%b-%d-%Y"), id: s[3], img: s[4]}}
  end

end
