class AddReferenceProjecttoSaving < ActiveRecord::Migration[6.0]
  def change
    add_reference :savings, :project, foreign_key: true
  end
end
