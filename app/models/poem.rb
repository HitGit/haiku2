class Poem < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true




end
