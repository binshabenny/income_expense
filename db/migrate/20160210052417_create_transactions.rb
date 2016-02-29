class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.integer :amount
      t.belongs_to :user, index:true
      t.references :trans, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

