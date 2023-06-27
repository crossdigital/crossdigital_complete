class ParticipantsController < ApplicationController
  before_action :set_game

  def new
    @participant = @game.participants.new
  end

  def create
    @participant = @game.participants.new(participant_params)

    if @participant.save
      session[:participant_id] = @participant.id
      redirect_to game_url(@game), notice: "Participant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def participant_params
    params.require(:participant).permit(:name, :role, :team)
  end
end
