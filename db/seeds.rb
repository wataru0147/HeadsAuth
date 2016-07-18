# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
brands = Brand.create([{ name: 'BedHeads', description: 'Hair Products'}, 
					   { name: 'Davines', description:'Hair Products'}
					   ])


categories = Category.create([{ name: 'Haircut' 			, description: ''}, 
							  { name: 'Tint/Color'			, description: ''},
							  { name: 'Classic Highlights'	, description: ''},
							  { name: 'Partial Foils'		, description: ''},
							  { name: 'Perm'				, description: ''},
							  { name: 'Straightening' 		, description: ''},
							  { name: 'Treatment'			, description: ''},
							  { name: 'Hair And Makeup'		, description: ''},
							  { name: 'Nails'				, description: ''},
							  { name: 'Others'				, description: ''}
							  	])