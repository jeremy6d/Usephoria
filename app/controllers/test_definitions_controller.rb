class TestDefinitionsController < ApplicationController
  # GET /tests
  # GET /tests.json
  def index
    @test_definitions = TestDefinition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_definitions }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test_definition = TestDefinition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_definition }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test_definition = TestDefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_definition }
    end
  end

  # GET /tests/1/edit
  def edit
    @test_definition = TestDefinition.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
  def create
    @test_definition = TestDefinition.new(params[:test])

    respond_to do |format|
      if @test_definition.save
        format.html { redirect_to @test_definition, notice: 'Test was successfully created.' }
        format.json { render json: @test_definition, status: :created, location: @test_definition }
      else
        format.html { render action: "new" }
        format.json { render json: @test_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @test_definition = TestDefinition.find(params[:id])

    respond_to do |format|
      if @test_definition.update_attributes(params[:test])
        format.html { redirect_to @test_definition, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test_definition = TestDefinition.find(params[:id])
    @test_definition.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end
end
