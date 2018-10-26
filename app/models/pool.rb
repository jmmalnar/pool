class Pool < ApplicationRecord

  validates :volume, presence: true

  belongs_to :user
  has_many :readings, dependent: :destroy
end
