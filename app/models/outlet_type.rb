class OutletType < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :surveys
end
