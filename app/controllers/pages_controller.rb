class PagesController < ApplicationController
  def index
  end

  def today
  end

  def cash_flow
  end

  def income
  	@incomes = Income.all
  	@entries = IncomeEntry.all
  end
end
