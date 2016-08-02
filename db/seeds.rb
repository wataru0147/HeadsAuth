# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
brands = Brand.create([{ name: 'BedHeads', description: 'Hair Products', published: true}, 
					   { name: 'Davines', description:'Hair Products', published: true}
					   ])


categories = Category.create([{ name: 'Hair Cut' 			, description: ''}, 
							  { name: 'Hair Color'			, description: ''},
							  { name: 'Nails, Hands and Feet'	, description: ''},
							  { name: 'Wigs'		, description: ''},
							  { name: 'Products'				, description: ''},
							  { name: 'Others'				, description: ''}
							  	])