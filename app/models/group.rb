class Group < ActiveRecord::Base

  has_many :posts
  has_many :group_users, :dependent => :delete_all
  has_many :users, :through => :group_users

  belongs_to :school

end
