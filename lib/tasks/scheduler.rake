desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Job.find_each(&:save)
  puts "done."
end

task :update_jobs => :environment do
  puts "Updating Phase to have crew_id"

  update_field_1 = Employee.all.where(crew_name: "Field 1 ")
  update_field_1.update_all(crew_id: 1)

  update_field_2 = Employee.all.where(crew_name: "Field 2 ")
  update_field_2.update_all(crew_id: 10)

  update_field_3 = Employee.all.where(crew_name: "Field 3 ")
  update_field_3.update_all(crew_id: 3)

  update_field_4 = Employee.all.where(crew_name: "Field 4 ")
  update_field_4.update_all(crew_id: 8)

  update_field_5 = Employee.all.where(crew_name: "Field 5 ")
  update_field_5.update_all(crew_id: 18)

  update_PM1 = Employee.all.where(crew_name: "PM1 (Ken)")
  update_PM1.update_all(crew_id: 17)

  update_PM2 = Employee.all.where(crew_name: "PM2 (Eric)")
  update_PM2.update_all(crew_id: 12)

  shop = Employee.all.where(crew_name: "Shop")
  shop.update_all(crew_id: 5)

  cabinet_design = Employee.all.where(crew_name: "Cabinet-Design")
  cabinet_design.update_all(crew_id: 6)

  interior_design = Employee.all.where(crew_name: "Interior-Design")
  interior_design.update_all(crew_id: 7)

  arch_design = Employee.all.where(crew_name: "Arch-Design")
  arch_design.update_all(crew_id: 9)

  marking = Employee.all.where(crew_name: "Marking")
  marking.update_all(crew_id: 14)

  admin = Employee.all.where(crew_name: "Admin")
  admin.update_all(crew_id: 14)

  phm = Employee.all.where(crew_name: "Planned Home Maintenance")
  phm.update_all(crew_id: 13)

  puts "Done"

end