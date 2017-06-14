class CreatePizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :ip
      t.integer :pizzanr
      t.boolean :grosse
      t.boolean :bezahlt
      t.boolean :augegeben
      t.boolean :deleted

      t.timestamps
    end
  end
end
