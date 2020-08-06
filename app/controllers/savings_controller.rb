class SavingsController < ApplicationController

  def index
    @savings = current_user.savings.savings_with_project.pluck(:name, :amount, :created_at).map {|s| {name: s[0], amount: s[1], date: s[2]}}
    @total_savings = total_savings(@savings)
  end

  def show
  end

  def new; end

  def create
  end

  def update
  end
  
  def edit
  end

  def destroy; end

end
