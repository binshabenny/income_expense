class RemoveColumnFromExpense < ActiveRecord::Migration
  def change
  	remove_column :expenses, :source
  end
end
