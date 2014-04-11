class School < ActiveRecord::Base

  has_many :groups
  has_many :posts
  has_many :users

  validates_uniqueness_of :name

end
