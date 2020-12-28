# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :find_arm, only: [:index, :destroy, :new, :create]

  def index
    @participants = @arm.participants
    respond_to do |format|
      format.html
      format.json { render :json => @participants }
    end
  end

  def new
    @participant ||= @arm.participants.new
  end

  def show; end

  def update; end

  def create
    @participant = @arm.participants.new(permit_params)
    if @participant.save
      redirect_to arm_participants_path(@arm.id)
    else
      render :new
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    redirect_to arm_participants_path(@arm.id) if @participant.destroy
  end

  private

  def permit_params
    params.require(:participant).permit(:name, :age, :gender)
  end

  def find_arm
    @arm = Arm.find_by(id: params[:arm_id])
  end
end
