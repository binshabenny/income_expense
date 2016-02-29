class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :income_categories, :expense_source, :income_source
  end
end
