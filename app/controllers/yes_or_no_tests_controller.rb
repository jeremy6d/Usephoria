class YesOrNoTestsController < ApplicationController
  # GET /yes_or_no_tests
  # GET /yes_or_no_tests.json
  def index
    @yes_or_no_tests = YesOrNoTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yes_or_no_tests }
    end
  end

  # GET /yes_or_no_tests/1
  # GET /yes_or_no_tests/1.json
  def show
    @yes_or_no_test = YesOrNoTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yes_or_no_test }
    end
  end

  # GET /yes_or_no_tests/new
  # GET /yes_or_no_tests/new.json
  def new
    @yes_or_no_test = YesOrNoTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yes_or_no_test }
    end
  end

  # GET /yes_or_no_tests/1/edit
  def edit
    @yes_or_no_test = YesOrNoTest.find(params[:id])
  end

  # POST /yes_or_no_tests
  # POST /yes_or_no_tests.json
  def create
    @yes_or_no_test = YesOrNoTest.new(params[:yes_or_no_test])

    respond_to do |format|
      if @yes_or_no_test.save
        format.html { redirect_to @yes_or_no_test, notice: 'Question and answer test was successfully created.' }
        format.json { render json: @yes_or_no_test, status: :created, location: @yes_or_no_test }
      else
        format.html { render action: "new" }
        format.json { render json: @yes_or_no_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yes_or_no_tests/1
  # PUT /yes_or_no_tests/1.json
  def update
    @yes_or_no_test = YesOrNoTest.find(params[:id])

    respond_to do |format|
      if @yes_or_no_test.update_attributes(params[:yes_or_no_test])
        format.html { redirect_to @yes_or_no_test, notice: 'Question and answer test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yes_or_no_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yes_or_no_tests/1
  # DELETE /yes_or_no_tests/1.json
  def destroy
    @yes_or_no_test = YesOrNoTest.find(params[:id])
    @yes_or_no_test.destroy

    respond_to do |format|
      format.html { redirect_to yes_or_no_tests_url }
      format.json { head :no_content }
    end
  end
end
