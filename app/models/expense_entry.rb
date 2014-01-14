class ExpenseEntry < ActiveRecord::Base
  belongs_to :expense
  attr_accessible :amount, :date, :notes, :expense_id

  validates :amount, presence: true
end
