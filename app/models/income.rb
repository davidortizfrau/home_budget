class Income < ActiveRecord::Base
  attr_accessible :forecast_anual, :forecast_monthly, :name
  has_many :incme_entries
end
