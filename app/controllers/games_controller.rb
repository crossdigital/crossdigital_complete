class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :hacky_set_game, only: %i[ start spymaster_move operative_move ]
  before_action :set_participant, only: %i[ show spymaster_move operative_move ]
  before_action :not_participant, only: %i[ spymaster_move operative_move ]
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.order(created_at: :desc)
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_url(@game), notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def start
    @game.start
    redirect_to game_url(@game), notice: "Game was successfully started."
  end

  def spymaster_move
    @card = @game.cards.find(params[:card_id])
    if !@game.is_move? @participant
      redirect_to game_url(@game), notice: "Not your move."
    elsif @game.move_role != "spymaster"
      redirect_to game_url(@game), notice: "Not spymaster move."
    elsif @card.selected
      redirect_to game_url(@game), notice: "Card already selected."
    else
      @card.update(selected: true)
      if @card.colour == @participant.team
        @game.update(last_hint_number: @game.last_hint_number - 1)
        @game.set_state
        if @game.last_hint_number <= 0
          @game.next_move
        end
      else
        @game.set_state
        @game.next_move
      end
      redirect_to game_url(@game), notice: "Card selected."
    end
  end

  def operative_move
    if !@game.is_move? @participant
      redirect_to game_url(@game), notice: "Not your move."
    elsif @game.move_role != "operative"
      redirect_to game_url(@game), notice: "Not operative move."
    else
      @game.update(operative_params)
      @game.next_move
      redirect_to game_url(@game), notice: "Added hint."
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def hacky_set_game
    @game = Game.find(params[:game_id])
  end

  def set_participant
    @participant = @game.participants.find_by(id: session[:participant_id])
  end

  def not_participant
    redirect_to game_url(@game), notice: "Not a participant." unless @participant
  end

  def game_params
    params.require(:game).permit(:name)
  end

  def operative_params
    params.require(:game).permit(:last_hint_text, :last_hint_number)
  end
end
