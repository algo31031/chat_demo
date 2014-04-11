class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  belongs_to :school

  # before_create :check_user

  attr_accessor :user_name

  # def check_user
  #   if self.user_name.present?
  #     user = User.find_by_name(self.user_name)
  #     user ||= User.new(:name => self.user_name)
  #     user.save!
  #     self.user_id = user.id
  #   end
  # end

end
