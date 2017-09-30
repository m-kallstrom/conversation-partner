class NewWord < ApplicationRecord
  belongs_to :conversation
  has_many :users, through: :conversations
end
