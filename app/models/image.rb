class Image < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :title, :url, :presence => true
end
