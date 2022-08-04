# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Variance.create(hour_variance: 0.71, hour_rate: 40)
r1 = Role.create({ name: 'Sales', description: 'Can read items' })
r2 = Role.create({ name: 'Manager', description: 'Can read and create items. Can update and destroy own items' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'admin', email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', role_id: r3.id })
