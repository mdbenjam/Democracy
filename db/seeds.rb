# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open(File.expand_path("~/workspace/lib/assets/bills.txt"), "r") do |f|
    f.each_line do |line|
        fields = line.split('",')
        bill = Bill.create(name: fields[0].sub('"', ''), 
            description: fields[2].sub('"', ''),
            status: fields[3].sub('"', ''),
            sponsor: fields[6].sub('"', ''))
        bill.save
    end
end
