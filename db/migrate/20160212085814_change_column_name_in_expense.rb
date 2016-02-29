class ChangeColumnNameInExpense < ActiveRecord::Migration
  def change
  	rename_column :expenses, :income_category_id, :expense_category_id
  end
end
