class ProductLogsController < ApplicationController
  # GET /product_logs
  # GET /product_logs.json
  def index
    @product_logs = ProductLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_logs }
    end
  end

  # GET /product_logs/1
  # GET /product_logs/1.json
  def show
    @product_log = ProductLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_log }
    end
  end

  # GET /product_logs/new
  # GET /product_logs/new.json
  def new
    @product_log = ProductLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_log }
    end
  end

  # GET /product_logs/1/edit
  def edit
    @product_log = ProductLog.find(params[:id])
  end

  # POST /product_logs
  # POST /product_logs.json
  def create
    @product_log = ProductLog.new(params[:product_log])

    respond_to do |format|
      if @product_log.save
        format.html { redirect_to @product_log, notice: 'Product log was successfully created.' }
        format.json { render json: @product_log, status: :created, location: @product_log }
      else
        format.html { render action: "new" }
        format.json { render json: @product_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_logs/1
  # PUT /product_logs/1.json
  def update
    @product_log = ProductLog.find(params[:id])

    respond_to do |format|
      if @product_log.update_attributes(params[:product_log])
        format.html { redirect_to @product_log, notice: 'Product log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_logs/1
  # DELETE /product_logs/1.json
  def destroy
    @product_log = ProductLog.find(params[:id])
    @product_log.destroy

    respond_to do |format|
      format.html { redirect_to product_logs_url }
      format.json { head :no_content }
    end
  end
end
