class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor ||= Doctor.new
  end

  def edit
  end

  def show
  end

  def create
    @doctor = Doctor.new(permit_params)
    if @doctor.save
      redirect_to doctors_path
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
    params.require(:doctor).permit(:name, :specification, clinic_ids: [])
  end
end
