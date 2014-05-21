# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([
	{name:'System Administrator'},
	{name:'Administrator'},
	{name:'General'}
])

User.create username:'sysadmin', password:'sysadmin', password_confirmation:'sysadmin', role_id:Role::SYSADMIN_ID
User.create username:'admin', password:'admin', password_confirmation:'admin', role_id:Role::ADMIN_ID
User.create username:'test', password:'test', password_confirmation:'test', role_id:Role::GENERAL_ID