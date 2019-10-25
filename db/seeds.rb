# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organization1 = Organization.create(title: 'Рога и копыта',
                                    form_of_owership: 'ЗАО',
                                    tax_number: 123456789,
                                    reg_number: 1234567890123)
organization2 = Organization.create(title: 'Свой, чужой',
                                    form_of_owership: 'ОАО',
                                    tax_number: 223456789,
                                    reg_number: 2234567890123)
organization3 = Organization.create(title: 'Дети детей',
                                    form_of_owership: 'ООО',
                                    tax_number: 323456789,
                                    reg_number: 3234567890123)

client1 = Client.create(email: 'client@test.com',
                        fullname: 'Иван Иванов',
                        phone: '+375(17)000-00-01',
                        password: '12345678',
                        organizations: [organization1])
client2 = Client.create(email: 'client2@test.com',
                        fullname: 'Сергей Сергеев',
                        phone: '+375(17)000-00-02',
                        password: '12345678',
                        organizations: [organization2])
client3 = Client.create(email: 'client3@test.com',
                        fullname: 'Петр Петров',
                        phone: '+375(17)000-00-03',
                        password: '12345678',
                        organizations: [organization3])

Staff.create(email: 'staff@test.com', password: '12345678')
Staff.create(email: 'staff2@test.com', password: '12345678')
Staff.create(email: 'staff3@test.com', password: '12345678')

Equipment.create(title: 'Bosh 2-24',
                 kind: 'puncher',
                 serial_number: 12345678,
                 organization: organization1)
Equipment.create(title: 'Bosh 2-26',
                 kind: 'puncher',
                 serial_number: 22345678,
                 organization: organization2)
Equipment.create(title: 'Bosh svf2',
                 kind: 'drill',
                 serial_number: 32345678,
                 organization: organization3)
