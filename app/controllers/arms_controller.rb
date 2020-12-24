class ArmsController < ApplicationController

  def index
    @arms = Arm.all
  end

  def new
    @arm ||= Arm.new
  end

  def show; end

  def update; end

  def create
    @arm = Arm.new(permit_params)
    if @arm.save
      redirect_to arms_path
    else
      render :new
    end
  end

  def destroy
    @arm = Arm.find(params[:id])
    redirect_to arms_path if @arm.destroy
  end

  private

  def permit_params
    params.require(:arm).permit(:name, :limit)
  end
end
