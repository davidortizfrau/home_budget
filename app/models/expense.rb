class Expense < ActiveRecord::Base
  attr_accessible :budget_monthly, :name

  validates :name, presence: true

  has_many :expense_entries

  default_scope order: :name

  def total_today
    total = 0
    self.expense_entries.this_day.each do |e|
      total += e.amount
    end
    total 
  end

  def total_month
    total = 0
    self.expense_entries.this_month.each do |e|
      total += e.amount
    end
    total 
  end

  def total_year
    total = 0
    self.expense_entries.this_year.each do |e|
      total += e.amount
    end
    total 
  end
  
end
