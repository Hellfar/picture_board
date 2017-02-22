# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

provider = User.create email: "provider@example.org", password: "password"
customer = User.create email: "customer@example.org", password: "password"

file_seeds_dir = "public/uploads/seeds"
Dir.entries(file_seeds_dir).each do | file_name |
  unless file_name == "." or file_name == ".."
    begin
      f = File.open "#{file_seeds_dir}#{File::SEPARATOR}#{file_name}" rescue nil
      Offer.create user: provider, picture: f
    ensure
      f.close if f
    end
  end
end

Offer.reindex
