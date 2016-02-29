class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string :expense_source
      t.text :desc
      t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
