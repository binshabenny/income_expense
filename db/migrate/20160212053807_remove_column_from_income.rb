class RemoveColumnFromIncome < ActiveRecord::Migration
  def change
  	remove_column :incomes, :source
  end
end
