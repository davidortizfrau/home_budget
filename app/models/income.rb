class Income < ActiveRecord::Base
  attr_accessible :forecast_anual, :forecast_monthly, :name
  has_many :income_entries

  validates :name, presence: true
  
  def total_today
  	total = 0
		self.income_entries.this_day.each do |e|
		  total += e.amount
	  end
	  total 
  end

  def total_month
  	total = 0
		self.income_entries.this_month.each do |e|
		  total += e.amount
	  end
	  total 
  end

  def total_year
  	total = 0
		self.income_entries.this_year.each do |e|
		  total += e.amount
	  end
	  total 
  end

end
