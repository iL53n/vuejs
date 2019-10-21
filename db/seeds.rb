# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client1 = Client.create(email: 'client@test.com',
                        fullname: 'Ivan Ivanov',
                        phone: '+375(17)0000001',
                        password: '12345678')
client2 = Client.create(email: 'client2@test.com',
                        fullname: 'Sergey Sergeev',
                        phone: '+375(17)0000002',
                        password: '12345678')
client3 = Client.create(email: 'client3@test.com',
                        fullname: 'Petr Petrov',
                        phone: '+375(17)0000003',
                        password: '12345678')

Staff.create(email: 'staff@test.com', password: '12345678')
Staff.create(email: 'staff2@test.com', password: '12345678')
Staff.create(email: 'staff3@test.com', password: '12345678')

organization1 = Organization.create(title: 'Organization_1',
                                    form_of_owership: 'JSC',
                                    tax_number: 123456789,
                                    reg_number: 1234567890123)
organization1.clients.push(client1)
organization2 = Organization.create(title: 'Organization_2',
                                    form_of_owership: 'JSC',
                                    tax_number: 223456789,
                                    reg_number: 2234567890123)
organization2.clients.push(client2)
organization3 = Organization.create(title: 'Organization_3',
                                    form_of_owership: 'JSC',
                                    tax_number: 323456789,
                                    reg_number: 3234567890123)
organization3.clients.push(client3)

Equipment.create(title: 'Bosh 2-24',
                 kind: 'puncher',
                 serial_number: 12345678,
                 organization: organization1.id)
Equipment.create(title: 'Bosh 2-26',
                 kind: 'puncher',
                 serial_number: 22345678,
                 organization_id: organization2.id)
Equipment.create(title: 'Bosh svf2',
                 kind: 'drill',
                 serial_number: 32345678,
                 organization_id: organization3.id)
