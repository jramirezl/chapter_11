# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([
                {name: "Example User", email: "jajajaja@example.com",password: "foobar", password_confirmation: "foobar"},
                {name: "Juan Ramirez", email: "juan@example.com",password: "juan01", password_confirmation: "juan01"},
                {name: "Pablo Londono", email: "pablo@example.com",password: "foobar", password_confirmation: "foobar"},
                {name: "Carlos Perez", email: "carlos@example.com",password: "foobar", password_confirmation: "foobar"},
                {name: "Vicente fer", email: "vicen@example.com",password: "juan01", password_confirmation: "juan01"},
                {name: "ana Perez", email: "ana@example.com",password: "foobar", password_confirmation: "foobar"},
                {name: "Maria stela", email: "maria@example.com",password: "foobar", password_confirmation: "foobar"},
                {name: "Alma Rod", email: "alma@example.com",password: "juan01", password_confirmation: "juan01"},
                {name: "Palomino", email: "pal@example.com",password: "foobar", password_confirmation: "foobar"}
            ])
