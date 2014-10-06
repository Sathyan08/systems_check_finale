class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, presence: true
end
