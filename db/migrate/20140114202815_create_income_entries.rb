class CreateIncomeEntries < ActiveRecord::Migration
  def change
    create_table :income_entries do |t|
      t.decimal :amount
      t.date :date
      t.references :income
      t.text :notes

      t.timestamps
    end
    add_index :income_entries, :income_id
  end
end
