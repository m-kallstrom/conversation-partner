class NewWord < ApplicationRecord
  belongs_to :conversation, optional: true
  has_many :users, through: :conversations

  validates :word, uniqueness: true
end
