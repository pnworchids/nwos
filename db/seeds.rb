# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(id: 1, name: "Judged Shows")
Category.create(id: 2, name: "Sales")

Event.create(id: 1, name: "Northwest Flower and Garden Show", venue: "Washington State Convention Center", street_address: "800 Convention Place", city: "Seattle", state_province: "WA", zip_code: "98101", geocode_lat: "47.611620", geocode_lng: "-122.331237", admission_info: "Price varies <br/> <a href=\"https://www.gardenshow.com/tickets/\" target=\"_blank\">tickets available here <i class=\"fa fa-angle-right\"></i></a>", description: "The Northwest Flower & Garden Show has been heralding the start of spring since 1989, as gardening enthusiasts from around the Northwest flock to this annual celebration, held in the beautiful Washington State Convention Center for five days. The Northwest Orchid Society will have a Garden Exhibit, “50 Shades of Orchids”, for this this year’s show theme “Art in Bloom.” Members will be there to answer all your orchid related questions.")
EventDate.create(starts_at: DateTime.new(2014,2,5,8), ends_at: DateTime.new(2014,2,5,20), event_id: 1)
EventDate.create(starts_at: DateTime.new(2014,2,6,8), ends_at: DateTime.new(2014,2,6,20), event_id: 1)
EventDate.create(starts_at: DateTime.new(2014,2,7,8), ends_at: DateTime.new(2014,2,7,20), event_id: 1)
EventDate.create(starts_at: DateTime.new(2014,2,8,8), ends_at: DateTime.new(2014,2,8,20), event_id: 1)
EventDate.create(starts_at: DateTime.new(2014,2,9,8), ends_at: DateTime.new(2014,2,9,18), event_id: 1)
EventCategory.create(event_id: 1, category_id: 2)

Event.create(id: 2, name: "NWOS February Meeting", venue: "UW Botantic Gardens, Center for Urban Horticulture", street_address: "3501 NE 41st Street", city: "Seattle", state_province: "WA", zip_code: "98105", geocode_lat: "47.657987", geocode_lng: "-122.290565")
EventDate.create(starts_at: DateTime.new(2014,2,10,19), ends_at: DateTime.new(2014,2,10,22), event_id: 2)




