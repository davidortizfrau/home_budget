class IncomeEntry < ActiveRecord::Base
  belongs_to :income
  attr_accessible :amount, :date, :notes, :income_id

  default_scope order("date desc")
end
