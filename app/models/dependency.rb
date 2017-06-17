class Dependency < ApplicationRecord
  belongs_to :package

  validates :name, presence: true, uniqueness: { scope: :os }
end
