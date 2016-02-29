class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :source
      t.integer :amount
      t.datetime :date
      t.belongs_to :user, index:true
      t.belongs_to :income_category, index:true

      t.timestamps null: false
    end
  end
end
