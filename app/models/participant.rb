class Participant < ApplicationRecord
  ROLES = [
    OPERATIVE = "operative",
    SPYMASTER = "spymaster"
  ]
  TEAMS = [
    RED = "red",
    BLUE = "blue"
  ]

  after_save :set_game_state
  
  scope :red_operatives, -> { where(role: OPERATIVE, team: RED) }
  scope :blue_operatives, -> { where(role: OPERATIVE, team: BLUE) }
  scope :red_spymasters, -> { where(role: SPYMASTER, team: RED) }
  scope :blue_spymasters, -> { where(role: SPYMASTER, team: BLUE) }

  belongs_to :game

  def set_game_state
    game.set_state
    game.save
  end
end
