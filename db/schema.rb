# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140115204228) do

  create_table "expense_entries", :force => true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.text     "notes"
    t.integer  "expense_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "expense_entries", ["expense_id"], :name => "index_expense_entries_on_expense_id"

  create_table "expenses", :force => true do |t|
    t.string   "name"
    t.decimal  "budget_monthly"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "track",          :default => false
  end

  create_table "income_entries", :force => true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.integer  "income_id"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "income_entries", ["income_id"], :name => "index_income_entries_on_income_id"

  create_table "incomes", :force => true do |t|
    t.string   "name"
    t.decimal  "forecast_monthly"
    t.decimal  "forecast_anual"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
