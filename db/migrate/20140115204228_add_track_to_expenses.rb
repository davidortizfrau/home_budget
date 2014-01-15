class AddTrackToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :track, :boolean, default: false
  end
end
