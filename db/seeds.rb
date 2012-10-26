# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ email: 'test001@scrum2b.com', password: '123456', password_confirmation: '123456' },
                    { email: 'test002@scrum2b.com', password: '123456', password_confirmation: '123456' }])

contacts = Contact.create([{ :is_customer=> "true", :contact_name => "test1", :email_address => "test1@scum2b.com" },
                            { :is_customer =>"true", :contact_name => "test2", :email_address => "test2@scum2b.com" },
                            { :is_customer => "true", :contact_name => "test3", :email_address => "test3@scum2b.com" },
                            { :is_customer => "false", :contact_name => "test4", :email_address => "test4@scum2b.com" }])

invoice = Invoice.create([{ :contact_id=> "1", :invoice_number => "123456", :due_date => "2012/21/10" },
                            { :contact_id =>"2", :invoice_number => "1234566", :due_date => "2012/21/10" },
                            { :contact_id => "3", :invoice_number => "123466", :due_date => "2012/21/10" },
                            { :contact_id => "4", :invoice_number => "123466", :due_date => "2012/21/10" }])
