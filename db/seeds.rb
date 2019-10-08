# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create(email: 'client@test.com',
              fullname: 'Ivan Ivanov',
              phone: '+375170000001',
              password: '12345678')
Client.create(email: 'client2@test.com',
              fullname: 'Sergey Sergeev',
              phone: '+375170000002',
              password: '12345678')
Client.create(email: 'client3@test.com',
              fullname: 'Petr Petrov',
              phone: '+375170000003',
              password: '12345678')

Staff.create(email: 'staff@test.com', password: '12345678')

Organization.create(title: 'Organization_1',
                    form_of_owership: 'JSC',
                    tax_number: 123456789,
                    reg_number: 1234567890123)
Organization.create(title: 'Organization_2',
                    form_of_owership: 'JSC',
                    tax_number: 223456789,
                    reg_number: 2234567890123)
Organization.create(title: 'Organization_3',
                    form_of_owership: 'JSC',
                    tax_number: 323456789,
                    reg_number: 3234567890123)
