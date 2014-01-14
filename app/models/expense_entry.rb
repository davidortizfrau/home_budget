class ExpenseEntry < ActiveRecord::Base
  belongs_to :expense
  attr_accessible :amount, :date, :notes, :expense_id

  validates :amount, presence: true

  default_scope order("date desc")

  scope :recent, limit(25)
end
