class AddImageUrLtoProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :image_url, :string
  end
end
