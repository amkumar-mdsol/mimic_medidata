class ClinicsController < ApplicationController

  def index
    @clinics = Clinic.all
  end

  def new
    @clinic ||= Clinic.new
  end

  def show
  end

  def update
  end
  
  def create
    @clinic = Clinic.new(permit_params)
    if @clinic.save
      redirect_to clinics_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def permit_params
    params.require(:clinic).permit(:name, :location, doctor_ids: [])
  end
end
