class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :model_name, presence: true
  validates :year, presence: true, numericality: { greater_than: 1919, less_than: 2015 }
  validates :mileage, presence: true, numericality: { greater_than: -1 }
  validates :color, presence: true
  validates :manufacturer_id, presence: true
end
