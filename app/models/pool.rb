class Pool < ApplicationRecord

  validates :volume, presence: true

  belongs_to :user
end
