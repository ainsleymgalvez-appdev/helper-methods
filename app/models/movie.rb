class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true


end
