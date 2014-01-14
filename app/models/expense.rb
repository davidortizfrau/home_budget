class Expense < ActiveRecord::Base
  attr_accessible :budget_anual, :budget_monthly, :name

  validates :name, presence: true

  has_many :expense_entries

  default_scope order: :name

  def today
  	total = 0
  	self.expense_entries.each do |entry|
  		if Date.today.to_formatted_s == entry.date
  			total += entry.amount
  		end
  	end
  	total
  end

  def this_month
  	# if date is within this month
  	total = 0
  	self.expense_entries.each do |entry|
  		total += entry.amount
  	end
  	total
  end

  def this_year
  	total = 0
  	self.expense_entries.each do |entry|
  		total += entry.amount
  	end
  	total
  end
end
