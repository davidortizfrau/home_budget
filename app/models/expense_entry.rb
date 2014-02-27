class ExpenseEntry < ActiveRecord::Base
  belongs_to :expense
  attr_accessible :amount, :date, :notes, :expense_id

  validates :amount, presence: true

  default_scope order("date desc")

  d = Date.today
  scope :this_day,   where('extract(year from date) = ? AND extract(month from date) = ? AND extract(day from date) = ?', d.year, d.month, d.day) 
  scope :this_month, where('extract(year from date) = ? AND extract(month from date) = ?', d.year, d.month) 
  scope :this_year,  where('extract(year from date) = ?', d.year) 

  scope :recent, limit(25)


  def self.total_today
  	total = 0
		ExpenseEntry.this_day.each do |e|
		  total += e.amount
	  end
	  total 
  end

  def self.total_month
		total = 0
		ExpenseEntry.this_month.each do |e|
		  total += e.amount
	  end
	  total  	
  end

  def self.total_year
  	total = 0
		ExpenseEntry.this_year.each do |e|
		  total += e.amount
	  end
	  total
  end
end
