class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :name
      t.decimal :forecast_monthly
      t.decimal :forecast_anual

      t.timestamps
    end
  end
end
