class BarcodesController < ApplicationController
  before_action :set_barcode, only: [:show, :edit, :update, :destroy]

  # GET /barcodes
  # GET /barcodes.json
  def index
    @barcodes = Barcode.paginate(:page => params[:page], :per_page => 100).order('id')
  end

  # GET /barcodes/1
  # GET /barcodes/1.json
  def show
    @readonly = !params.has_key?(:edit)
  end

  def import
    @result = Barcode.loadData(JSON.parse(params['records']))
    respond_to do |format|
      format.json
    end
  end

  # GET /barcodes/new
  def new
    @barcode = Barcode.new
  end

  # GET /barcodes/1/edit
  def edit
  end

  # POST /barcodes
  # POST /barcodes.json
  def create
    @barcode = Barcode.new(barcode_params)

    respond_to do |format|
      if @barcode.save
        format.html { redirect_to @barcode, notice: 'Barcode was successfully created.' }
        format.json { render :show, status: :created, location: @barcode }
      else
        format.html { render :new }
        format.json { render json: @barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barcodes/1
  # PATCH/PUT /barcodes/1.json
  def update
    @obj = @barcode.send params['classname'].underscore

    obj_params = {}
    params.each do |k, v|
      obj_params[k] = v if !%w(classname commit action controller authenticity_token _method utf8).include?(k)
    end

    respond_to do |format|
      if @obj.update(obj_params)
        format.html { redirect_to @barcode, notice: 'Barcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @barcode }
      else
        format.html { render :edit }
        format.json { render json: @barcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barcodes/1
  # DELETE /barcodes/1.json
  def destroy
    @barcode.destroy
    respond_to do |format|
      format.html { redirect_to barcodes_url, notice: 'Barcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcode
      @barcode = Barcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barcode_params
      params[:barcode].permit(:id)
    end
end
