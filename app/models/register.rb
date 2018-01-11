class Register < ApplicationRecord
  validates :name, presence: true

  has_many :votes
  accepts_nested_attributes_for :votes, reject_if: :all_blank, allow_destroy: true
end
