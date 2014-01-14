class IncomeEntriesController < ApplicationController
  # GET /income_entries
  # GET /income_entries.json
  def index
    @income_entries = IncomeEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_entries }
    end
  end

  # GET /income_entries/1
  # GET /income_entries/1.json
  def show
    @income_entry = IncomeEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income_entry }
    end
  end

  # GET /income_entries/new
  # GET /income_entries/new.json
  def new
    @income_entry = IncomeEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income_entry }
    end
  end

  # GET /income_entries/1/edit
  def edit
    @income_entry = IncomeEntry.find(params[:id])
  end

  # POST /income_entries
  # POST /income_entries.json
  def create
    @income_entry = IncomeEntry.new(params[:income_entry])

    respond_to do |format|
      if @income_entry.save
        format.html { redirect_to "/income", notice: 'Income entry was successfully created.' }
        format.json { render json: @income_entry, status: :created, location: @income_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @income_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /income_entries/1
  # PUT /income_entries/1.json
  def update
    @income_entry = IncomeEntry.find(params[:id])

    respond_to do |format|
      if @income_entry.update_attributes(params[:income_entry])
        format.html { redirect_to @income_entry, notice: 'Income entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_entries/1
  # DELETE /income_entries/1.json
  def destroy
    @income_entry = IncomeEntry.find(params[:id])
    @income_entry.destroy

    respond_to do |format|
      format.html { redirect_to income_entries_url }
      format.json { head :no_content }
    end
  end
end
