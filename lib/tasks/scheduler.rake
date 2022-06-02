desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Job.find_each(&:save)
  puts "done."
end

task :update_jobs => :environment do
  puts "Updating Phase to have crew_id"

  update_field_1 = Employee.all.where(crew_name: '1')
  update_field_1.update_all(crew_name: "Field 1 ")

  update_field_2 = Employee.all.where(crew_name: '10')
  update_field_2.update_all(crew_name: "Field 2 ")

  update_field_3 = Employee.all.where(crew_name: '3')
  update_field_3.update_all(crew_name: "Field 3 ")

  update_field_4 = Employee.all.where(crew_name: '8')
  update_field_4.update_all(crew_name: "Field 4 ")

  update_field_5 = Employee.all.where(crew_name: '18')
  update_field_5.update_all(crew_name: "Field 5 ")

  update_PM1 = Employee.all.where(crew_name: '17')
  update_PM1.update_all(crew_name: "PM1 (Ken)")

  update_PM2 = Employee.all.where(crew_name: '12')
  update_PM2.update_all(crew_name: "PM2 (Eric)")

  shop = Employee.all.where(crew_name: 5)
  shop.update_all(crew_name: "Shop")

  cabinet_design = Employee.all.where(crew_name: '6')
  cabinet_design.update_all(crew_name: "Cabinet-Design")

  interior_design = Employee.all.where(crew_name: '7')
  interior_design.update_all(crew_name: "Interior-Design")

  arch_design = Employee.all.where(crew_name: '9')
  arch_design.update_all(crew_name: "Arch-Design")

  marking = Employee.all.where(crew_name: '14')
  marking.update_all(crew_name: "Marking")

  admin = Employee.all.where(crew_name: '14')
  admin.update_all(crew_name: "Admin")

  phm = Employee.all.where(crew_name: '13')
  phm.update_all(crew_name: "Planned Home Maintenance")

  puts "Done"

end