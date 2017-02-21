# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

provider = User.create email: "provider@example.org", password: "password"
customer = User.create email: "customer@example.org", password: "password"

Offer.create user: provider, picture: "http://cdn3-www.comingsoon.net/assets/uploads/gallery/doctor-strange-1403135280/screen-shot-2016-04-06-at-10-35-22-am.png"
Offer.create user: provider, picture: "http://static2.comicvine.com/uploads/scale_small/11/113509/4426613-1804688415-YfpcY.jpg"
Offer.create user: provider, picture: "http://vignette2.wikia.nocookie.net/ironman/images/9/9f/Captain-america-civil-war-iron-man-xlvi-sixth-scale-marvel-silo-902708.png/revision/latest?cb=20160610130645"
