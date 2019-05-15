class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(doses_params)
    if @doses.save
      redirect_to doses_path(@doses)
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])

  end

  def update
    if @dose.update(dose_params)
      redirect_to doses_path
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient)
  end
end
