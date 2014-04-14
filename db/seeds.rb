# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

school = School.create!(:name => "test_school")
group = Group.new(:name => "test_group")
group.school = school
group.save!
user = User.new(:name => "test_user")
user.school =school
user.groups = [group]
user.save!
group.update_attribute(:created_by_id, user.id)