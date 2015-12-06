# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TodoItem.destroy_all
User.destroy_all

Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", gender:"female", birth_year:1954},
  { first_name: "Donald", last_name: "Trump", gender:"male", birth_year:1946},
  { first_name: "Ben", last_name: "Carson", gender:"male", birth_year:1951},
  { first_name: "Hillary", last_name: "Clinton", gender:"female", birth_year:1947}
]

Profile.all.each do |profile|
  user = User.create! [
    { username: profile.last_name, password_digest: "password#{profile.last_name}"}
  ].first
  user.profile = profile
  todo_list = TodoList.create! [
    {list_name: "List for #{profile.first_name} #{profile.last_name}", list_due_date: Date.today + 1.year}
   ].first
  user.todo_lists << todo_list
  1.upto(5) do |i|
    todo_item = TodoItem.create! [
      {due_date: Date.today + 1.year, title: "Item#{i}", description:"Description of item #{i}"}
    ]
    todo_list.todo_items << todo_item
  end
end
