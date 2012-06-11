# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lookups = Lookup.create([
  { item: 'Project name', value: '' },
  { item: 'Offline', value: '' },
  { item: 'BackgroundColor', value '#DDD' },
  ])

users = User.create([
  { username: 'lbonnyca', fullname: 'Lori Bonnycastle', is_admin: 1 },
  { username: 'pchines', fullname: 'Peter Chines', is_admin: 1 },
  { username: 'fc', fullname: 'Francis Collins', is_admin: 0 },
  { username: 'aswift', fullname: 'Amy Swift', is_admin: 0 },
  { username: 'mikee', fullname: 'Mike Erdos', is_admin: 0 },
  { username: 'morkenm', fullname: 'Mario Morken', is_admin: 0 },
  { username: 'narisu', fullname: 'Narisu Narisu', is_admin: 0 },
  { username: 'parkerst', fullname: 'Stephen Parker', is_admin: 0 },
  { username: 'stitzelm', fullname: 'Michael Stitzel', is_admin: 0 },
  { username: 'duboseaj', fullname: 'Amanda DuBose', is_admin: 0 },
  { username: 'ramirezah', fullname: 'Andrea Ramirez', is_admin: 0 },
  ])
