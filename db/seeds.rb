# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

crew_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
phase_array = ["Framing", "Demo", "Foundation", "Interior-Finishing", "Arch-Design", "Cabinet-Design",
               "Interior-Design", "Punch-List", "Project Management"]
division_array = ["New Construction", "Remodel-Repair", "Design", "PHM", "Admin", "Shop"]

role_array = ["Foreman", "Lead Designer", "Project Manager", "Carpenter", "Cabinet Maker", "Director of Finance", "Director of Operations", "Director of Sales", "IT", "Interior Designer", "Office Admin", "Marketing", "Sales"]

name_array = ["Lance Foley", "Bret A", "Tracey R", "Lee Homola", "Kurt R", "Nathan R", "Reed B", "Ken P", "Adam", "Jake E", "Connor V", "Eric B", "Dan B", "Dan W", " James E", "Hunter G", "Paul J"]
crews = Crew.create([{ name: "Field 1" }, { name: "Field 2" }, { name: "Field 3" },
                     { name: "Field 4" }, { name: "Arch-Design" }, { name: "Cabinet-Design" },
                     { name: "Interior-Design" }, { name: "PM(1)" }, { name: "PM(2)" }, { name: "Shop" }])
phases = Phase.create([{ name: "Framing" }, { name: "Demo" }, { name: "Foundation" },
                       { name: "Interior-Finishing" }, { name: "Arch-Design" }, { name: "Cabinet-Design" },
                       { name: "Interior-Design" }, { name: "Punch-List" }, { name: "Project Management" }])
divisions = Division.create([{ name: "New Construction" }, { name: "Remodel-Repair" }, { name: "Design" },
                             { name: "PHM" }, { name: "Admin" }, { name: "Shop" }])
role = Role.create([{ name: "Foreman" }, { name: "Carpenter" }, { name: "Design Lead" }, { name: "Interior Designer" }, { name: "Cabinet Designer" }, { name: "Cabinet Maker" },
                    { name: "IT" }, { name: "Office Admin" }, { name: "Sales" }, { name: "Marketing" },])
100.times do |index|
  Job.create!(name: "Title #{index}",
              start_date: DateTime.new(2022, 1, 1, 17),
              end_date: DateTime.new(2022, 9, 9, 19),
              crew_id: crew_array.sample,
              man_hours: index + 2 * 2 * index + 100.to_i,
              phase: phase_array.sample,
              division: division_array.sample,
              total_cost: index + 2 * 5 * index,
              sub_cost: index + 2 * 2 * index,
              hours_per_week: index,
              weeks: index,
              week_remaining: index,
              hours_remaining: index,
              three_month_hours: index,
              six_month_hours: index,
              nine_month_hours: index,
              twelve_month_hours: index
  )

end
15.times do |index|
  Employee.create!(name: name_array.sample,
                   crew_id: crew_array.sample,
                   division: division_array.sample,
                   role: role_array.sample,
                   man_hours_per_week: 40,
                   man_hours_per_month: 0,
                   man_hours_three_months: 0,
                   man_hours_six_months: 0,
                   man_hours_nine_months: 0,
                   man_hours_twelve_months: 0,
                   true_man_hours_per_week: 0

  )
end