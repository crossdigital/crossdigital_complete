class Card < ApplicationRecord
  belongs_to :word
  belongs_to :game
end
