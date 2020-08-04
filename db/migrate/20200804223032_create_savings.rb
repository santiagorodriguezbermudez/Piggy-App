class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.string :name
      t.decimal :amount
      t.users :reference

      t.timestamps
    end
  end
end
