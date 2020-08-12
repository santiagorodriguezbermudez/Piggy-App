class SavingsController < ApplicationController
  def index
    @savings = Saving.return_savings(current_user.savings)
    @total_savings = current_user.savings.savings_with_project.sum(:amount)
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    @saving.author = current_user

    respond_to do |format|
      if @saving.save
        format.html { redirect_to root_path, notice: "#{@saving.name} was registered." }
      else
        format.html { render :new }
      end
    end
  end

  def savings_with_no_project
    @savings = Saving.return_savings(current_user.savings, 'other')
    @total_savings = current_user.savings.savings_with_no_project.sum(:amount)
  end

  private

  def saving_params
    params.require(:saving).permit(:name, :amount, :project_id)
  end
end
