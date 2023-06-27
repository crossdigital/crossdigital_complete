class Game < ApplicationRecord
  STATES = [
    WAITING_FOR_PARTICIPANTS = 'waiting_for_participants',
    PARTICIPANTS_FOUND = 'participants_found',
    ACTIVE = 'active',
    FINISHED = 'finished'
  ]

  has_many :cards
  has_many :participants, -> { order team: :asc, role: :desc }

  after_create :set_up, :set_state
  broadcasts_to ->(game) { game }

  def set_up
    words = Word.all.sample(25)
    black_word = words[0]
    safe_words = words[1..6]
    red_words = words[7..15]
    blue_words = words[16..]
    card_insert = [{game_id: id, word_id: black_word.id, colour: :black, created_at: Time.now, updated_at: Time.now}]
    safe_words.each do |word|
      card_insert.append({game_id: id, word_id: word.id, colour: :white, created_at: Time.now, updated_at: Time.now})
    end
    red_words.each do |word|
      card_insert.append({game_id: id, word_id: word.id, colour: :red, created_at: Time.now, updated_at: Time.now})
    end
    blue_words.each do |word|
      card_insert.append({game_id: id, word_id: word.id, colour: :blue, created_at: Time.now, updated_at: Time.now})
    end
    cards.insert_all(card_insert.shuffle)
    self.move_team = %w[red blue].sample
    self.move_role = "operative"
    save
  end

  def start
    return unless state == PARTICIPANTS_FOUND
    self.state = ACTIVE
    save
  end

  def set_state
    return if state == FINISHED
    if have_spymasters? && have_operatives?
      if state == ACTIVE
        check_end_game
      else
        self.state = PARTICIPANTS_FOUND
      end
    else
      self.state = WAITING_FOR_PARTICIPANTS
    end
    save
  end

  def check_end_game
    if cards.where(colour: "black", selected: true).present?
      lost(move_team)
    elsif cards.where(colour: "red", selected: false).empty?
      lost('blue')
    elsif cards.where(colour: "blue", selected: false).empty?
      lost('red')
    end
  end

  def is_move? participant
    participant.team == move_team && participant.role == move_role
  end

  def next_move
    if move_role == "operative"
      self.move_role = "spymaster"
    else
      self.move_role = "operative"
      self.move_team = move_team == 'red' ? 'blue' : 'red'
    end
    save
  end

  def lost(team)
    self.winning_team = team == 'red' ? 'blue' : 'red'
    self.state = FINISHED
  end

  def have_spymasters?
    participants.red_spymasters.present? && participants.blue_spymasters.present?
  end

  def have_operatives?
    participants.red_operatives.present? && participants.blue_operatives.present?
  end
end
