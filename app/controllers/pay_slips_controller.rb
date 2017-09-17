class PaySlipsController < ApplicationController
  before_action :set_pay_slip, only: [:show, :edit, :update, :destroy]

  # GET /pay_slips
  # GET /pay_slips.json
  def index
    @pay_slips = PaySlip.all
  end

  # GET /pay_slips/1
  # GET /pay_slips/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'show',
               layout: 'pdf.html'
      end
    end
  end

  # GET /pay_slips/new
  def new
    @pay_slip = PaySlip.new
  end

  # GET /pay_slips/1/edit
  def edit
  end

  # POST /pay_slips
  # POST /pay_slips.json
  def create
    @pay_slip = PaySlip.new(pay_slip_params)

    respond_to do |format|
      if @pay_slip.save
        format.html { redirect_to @pay_slip, notice: 'Pay slip was successfully created.' }
        format.json { render :show, status: :created, location: @pay_slip }
      else
        format.html { render :new }
        format.json { render json: @pay_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_slips/1
  # PATCH/PUT /pay_slips/1.json
  def update
    respond_to do |format|
      if @pay_slip.update(pay_slip_params)
        format.html { redirect_to @pay_slip, notice: 'Pay slip was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_slip }
      else
        format.html { render :edit }
        format.json { render json: @pay_slip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_slips/1
  # DELETE /pay_slips/1.json
  def destroy
    @pay_slip.destroy
    respond_to do |format|
      format.html { redirect_to pay_slips_url, notice: 'Pay slip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_slip
      @pay_slip = PaySlip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_slip_params
      params.require(:pay_slip).permit(:slip_no, :name, :income)
    end
end
