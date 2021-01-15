# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all # only since playground app
Airport.create([{ id: 1, code: 'MDW', city: 'Chicago' }, { id: 2,  code: 'DEN', city: 'Denver' },
                { id: 3, code: 'VRN', city: 'Verona, IT' }, { id: 4, code: 'HND', city: 'Tokyo, JP' },
                { id: 5, code: 'IST', city: 'Istanbul, TR' }])

Flight.destroy_all # only since playground app
Flight.create([{ duration: 439, take_off: '2011-01-05 01:00:00 UTC', departure_id: 1, arrival_id: 3 },
               { duration: 439, take_off: '2011-01-05 04:00:00 UTC', departure_id: 1, arrival_id: 3 },
               { duration: 439, take_off: '2011-01-05 07:00:00 UTC', departure_id: 1, arrival_id: 3 },
               { duration: 154, take_off: '2021-05-05 01:00:00 UTC', departure_id: 3, arrival_id: 5 },
               { duration: 597, take_off: '2022-09-13 09:22:10 UTC', departure_id: 4, arrival_id: 2 },
               { duration: 123, take_off: '2020-09-22 18:20:00 UTC', departure_id: 2, arrival_id: 1 },
               { duration: 692, take_off: '2011-01-05 11:00:00 UTC' , departure_id: 1, arrival_id: 5 }])
