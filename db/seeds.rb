require_relative("../models/familiar")
require_relative("../models/witch")
require("pry")

Familiar.delete_all()
Witch.delete_all()

familiar1 = Familiar.new({
  "name" => "Lying Cat",
  "species" => "cat",
  "admission_date" => "June 2018",
  "adoptable" => true
  })

familiar1.save()

familiar2 = Familiar.new({
  "name" => "Salem",
  "species" => "cat",
  "admission_date" => "February 2019",
  "adoptable" => false
  })

familiar2.save()

familiar3 = Familiar.new({
  "name" => "Hedwig",
  "species" => "owl",
  "admission_date" => "January 2019",
  "adoptable" => true
  })

familiar3.save()

familiar4 = Familiar.new({
  "name" => "Pantalaimon",
  "species" => "ermine",
  "admission_date" => "March 1861",
  "adoptable" => false
  })

familiar4.save()

witch1 = Witch.new({
  "first_name" => "Agnes",
  "last_name" => "Nutter"
  })

witch1.save()

witch2 = Witch.new({
  "first_name" => "Sophie",
  "last_name" => "Hatter"
  })

witch2.save()

witch3 = Witch.new({
  "first_name" => "Eskarina",
  "last_name" => "Smith"
  })

witch3.save()

witch4 = Witch.new({
  "first_name" => "Mildred",
  "last_name" => "Hubble"
  })

witch4.save()

binding.pry
nil
