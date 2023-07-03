# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# accountant:
#   email: accountant@kpmg.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>

# manager:
#   email: manager@kpmg.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>

# eavesdropper:
#   email: eavesdropper@pwc.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>

Company.create(name: 'KPMG')
Company.create(name: 'PwC')

accountant = User.create(email: "accountant@kpmg.com", encrypted_password: "password", company_id: 1)
manager = User.create(email: "manager@kpmg.com", encrypted_password: "password", company_id: 1)
eavesdropper = User.create(email: "eavesdropper@pwc.com", encrypted_password: "password", company_id: 2)
