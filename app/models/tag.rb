class Tag < ActiveRecord::Base
  has_and_belongs_to_many :images

  validates :name, :presence => true
end
