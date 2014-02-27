class Expense < ActiveRecord::Base
  attr_accessible :budget_monthly, :name, :track

  validates :name, :budget_monthly, presence: true

  has_many :expense_entries

  default_scope order: :name

  scope :track, where("track = true")

  def total_today
    total = 0
    self.expense_entries.this_day.each do |e|
      total += e.amount
    end
    total 
  end

  def this_month_total
    total = 0
    self.expense_entries.this_month.each do |e|
      total += e.amount
    end
    total 
  end

  def cashflow(month)
    self.budget_monthly - self.month_total(month)
  end

  def month_total(month)
    total = 0
    self.expense_entries.where('extract(year from date) = ? 
                                AND extract(month from date) = ?', 
                                Date.today.year, month).each do |e|
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

  def month_average
    if self.month_range
      self.total_year / self.month_range.count
    else
      0
    end
  end

  def month_range
    entries = self.expense_entries.this_year
    
    if entries.count > 0
      a = entries.last.date.month
      b = entries.first.date.month
      (a..b)
    else
      false
    end

  end

  # Class Methods
  def self.monthly_budget
    total = 0
    Expense.all.each do |expense|
      total += expense.budget_monthly
    end
    total
  end

  def self.total_month_expenses
    total = 0
    Expense.all.each do |expense|
      expense.expense_entries.this_month.each do |entry|
        total += entry.amount
      end
    end
    total
  end


  
end
