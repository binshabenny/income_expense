class ChangeDateFormatInMyExpense < ActiveRecord::Migration
  def change
 	change_column :expenses, :date, :datetime
  end
end
