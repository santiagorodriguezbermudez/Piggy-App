class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :icon
      t.decimal :goal

      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
