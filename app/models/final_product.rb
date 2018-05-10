class FinalProduct < ApplicationRecord
  belongs_to :user
  belongs_to :art
  belongs_to :item
  has_many_attached :images
end
