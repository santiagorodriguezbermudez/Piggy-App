class RemoveIconFromProject < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :icon, :string
  end
end
