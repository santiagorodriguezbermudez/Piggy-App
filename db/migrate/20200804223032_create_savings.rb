class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.string :name
      t.decimal :amount
      t.belongs_to :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
