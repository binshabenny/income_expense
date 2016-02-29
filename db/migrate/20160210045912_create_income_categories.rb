class CreateIncomeCategories < ActiveRecord::Migration
  def change
    create_table :income_categories do |t|
      
      t.string :expense_source
      t.text :desc
      t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
