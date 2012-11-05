class Tengine::BatchesController < ApplicationController
  # GET /tengine/batches
  # GET /tengine/batches.json
  def index
    @tengine_batches = Tengine::Batch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tengine_batches }
    end
  end

  # GET /tengine/batches/1
  # GET /tengine/batches/1.json
  def show
    @tengine_batch = Tengine::Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tengine_batch }
    end
  end

  # GET /tengine/batches/new
  # GET /tengine/batches/new.json
  def new
    @tengine_batch = Tengine::Batch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tengine_batch }
    end
  end

  # GET /tengine/batches/1/edit
  def edit
    @tengine_batch = Tengine::Batch.find(params[:id])
  end

  # POST /tengine/batches
  # POST /tengine/batches.json
  def create
    @tengine_batch = Tengine::Batch.new(params[:tengine_batch])

    respond_to do |format|
      if @tengine_batch.save
        format.html { redirect_to @tengine_batch, notice: 'Batch was successfully created.' }
        format.json { render json: @tengine_batch, status: :created, location: @tengine_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @tengine_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tengine/batches/1
  # PUT /tengine/batches/1.json
  def update
    @tengine_batch = Tengine::Batch.find(params[:id])

    respond_to do |format|
      if @tengine_batch.update_attributes(params[:tengine_batch])
        format.html { redirect_to @tengine_batch, notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tengine_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tengine/batches/1
  # DELETE /tengine/batches/1.json
  def destroy
    @tengine_batch = Tengine::Batch.find(params[:id])
    @tengine_batch.destroy

    respond_to do |format|
      format.html { redirect_to tengine_batches_url }
      format.json { head :no_content }
    end
  end
end
