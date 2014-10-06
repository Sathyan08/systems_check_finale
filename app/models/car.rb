class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :name, presence: true
  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :mileage, numericality: true, presence: true
  validates :year, numericality:  {greater_than: 1920}, presence: true
end
