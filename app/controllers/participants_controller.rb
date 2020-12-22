class ParticipantsController < ApplicationController

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def show
  end

  def update
  end

  def create
    participant = Participant.new(permit_params)
    if participant.save
      redirect_to '/participants'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def permit_params
    params.require(:participant).permit(:name, :age, :gender)
  end
end
