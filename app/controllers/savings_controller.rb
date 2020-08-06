class SavingsController < ApplicationController

  def index
    @savings = current_user.savings.savings_with_project.pluck(:name, :amount, :created_at).map {|s| {name: s[0], amount: s[1], date: s[2]}}
    @total_savings = current_user.savings.savings_with_project.sum(:amount)
  end

  def show
  end

  def new
    @saving = Saving.new
  end


  def create
    @saving = Saving.new(saving_params)
    @saving.author = current_user
    @saving.project_id = Project.find_by(name:params[:saving][:project_id]).id
    
    respond_to do |format|
      if @saving.save
        format.html { redirect_to root_path, notice: "The Saving #{@saving.name} was registered." }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end
  
  def edit
  end

  def destroy; end

  def savings_with_no_project
    @savings = current_user.savings.savings_with_no_project.pluck(:name, :amount, :created_at).map {|s| {name: s[0], amount: s[1], date: s[2]}}
    @total_savings = current_user.savings.savings_with_no_project.sum(:amount)
  end

  private

  def saving_params
    params.require(:saving).permit(:name, :amount, :project_id)
  end

end
