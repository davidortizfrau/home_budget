class RemoveBudgetAnualFromExpenses < ActiveRecord::Migration
  def up
    remove_column :expenses, :budget_anual
  end

  def down
    add_column :expenses, :budget_anual, :decimal
  end
end
