class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :expense_category
	has_many :transactions, as: :trans
end
