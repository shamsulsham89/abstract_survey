class StockAvailabilityType < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :surveys
end
