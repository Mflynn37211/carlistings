class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :model_name, presence: true
  validates :year, presence: true, numericality: { greater_than: 1919, less_than_or_equal_to: Time.now.year }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :manufacturer, presence: true
end
