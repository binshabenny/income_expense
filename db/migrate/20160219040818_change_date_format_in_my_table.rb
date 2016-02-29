class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  	change_column :incomes, :date, :date
  	change_column :expenses, :date, :date
  end
end
