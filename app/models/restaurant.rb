class Restaurant < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
