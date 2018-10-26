class Reading < ApplicationRecord

  validates :datetime, presence: true

  belongs_to :pool
end
