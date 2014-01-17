class PagesController < ApplicationController
  def index
  end

  def cash_flow
  	@date = Date.today
  	
  	@in_forecast = Income.month_forecast
  	@in_month =    IncomeEntry.total_month
  	@in_year =     IncomeEntry.total_year

  	@out_forecast = Expense.monthly_budget
  	@out_month =    Expense.total_month_expenses
  	@out_year =     ExpenseEntry.total_year
  end

  def income
  	@incomes = Income.all
  	@entries = IncomeEntry.all
  end
end
