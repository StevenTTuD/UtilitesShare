# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  charge_type :integer
#  price       :integer
#  payer       :integer
#  payee       :integer
#  paid_at     :date
#  note        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end


  def update
    respond_to do |format|
      if @charge.pay
        format.html { redirect_to @charge, notice: '付了' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new(charge_params)
    respond_to do |format|
      if @charge.save
        Charge.auto_generate_charge(@charge)
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:charge_type, :price, :payee, :payer, :note, :paid_at)
    end
end
