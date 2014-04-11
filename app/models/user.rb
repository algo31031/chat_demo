class User < ActiveRecord::Base

  has_many :posts
  has_many :group_users
  has_many :groups, :through => :group_users

  belongs_to :school

  validates_uniqueness_of :name, :scope => :school_id

end
