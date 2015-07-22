class Poem < ActiveRecord::Base
  acts_as_votable

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true


end
