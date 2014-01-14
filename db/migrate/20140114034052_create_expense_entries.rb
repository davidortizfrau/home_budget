class CreateExpenseEntries < ActiveRecord::Migration
  def change
    create_table :expense_entries do |t|
      t.decimal :amount
      t.date :date
      t.text :notes
      t.references :expense

      t.timestamps
    end
    add_index :expense_entries, :expense_id
  end
end
