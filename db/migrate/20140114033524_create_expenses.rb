class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :budget_monthly
      t.decimal :budget_anual

      t.timestamps
    end
  end
end
