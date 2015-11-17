# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Bikeroute.delete_all
# routes = Bikeroute.create([
#   {
#     name: 'The Wiggle',
#     description: "Lorem ipsum de wolf vos col de perjuret feed zone randonneur, forest of arenberg hinault operacion puerto an festina. Soigneur echelon, stijn devolder mmmaiko nokere koerse ventoux ghent arrivere, cutters danseuse van steenbergen garin! Bromont res firma mitescere nescit van summeren, ombregt rouleur derby cycles goff venga venga venga omloop het volk on the rivet.\nTopsport vlaanderen van steenbergen once! Pedal bettini taaienberg schleck, bosberg monte paschi eroica echelon play rouleur derby paris-roubaix virenque, muur belleville. Ronde van belgie horizontally stiff but vertically compliant bartali longo bianchi, petacchi vuelta a espana berg ter stene de vlaeminck bronzini vendee. Kuurne-brussels-kuurne alpe d\'huez indurain cog petacchi omnium.",
#     lane_type: 'Sharrows',
#     grade: '2',
#     distance: '0.7',
#     twitter_tag: 'TheWiggleCRSF',
#     twitter_search:'<a class="twitter-timeline" href="https://twitter.com/hashtag/TheWiggleCRSF" data-widget-id="611617017599135744">#TheWiggleCRSF Tweets</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?"http":"https";if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>',
#     map:'https://www.dropbox.com/s/ea274rjll62ky5s/thewiggle.png?raw=1'
#   },
#   {
#     name: 'Market Street',
#     description: 'Castro to the Ferry Building',
#     lane_type: 'Dedicated Lane',
#     grade: '1',
#     distance: '3'
#   },
#   {
#     name: 'The Embarcadero',
#     description: 'Ferry Building to Pier 39',
#     lane_type: 'Separated Lane',
#     grade: '0',
#     distance: '2'
#   },
#   {
#     name: 'The Panhandle',
#     description: 'Haight to Golden Gate Park',
#     lane_type: 'Bike Path',
#     grade: '3',
#     distance: '1'
#   }
# ])

manyHoods = [{name:'Seacliff',slug:'seacliff'},{name:'Lake Street',slug:'lake-street'},{name:'Presidio National Park',slug:'presidio-national-park'},{name:'Presidio Terrace',slug:'presidio-terrace'},{name:'Inner Richmond',slug:'inner-richmond'},{name:'Sutro Heights',slug:'sutro-heights'},{name:'Lincoln Park Ft Miley',slug:'lincoln-park-ft-miley'},{name:'Outer Richmond',slug:'outer-richmond'},{name:'Golden Gate Park',slug:'golden-gate-park'},{name:'Presidio Heights',slug:'presidio-heights'},{name:'Laurel Heights Jordan Park',slug:'laurel-heights-jordan-park'},{name:'Lone Mountain',slug:'lone-mountain'},{name:'Anza Vista',slug:'anza-vista'},{name:'Cow Hollow',slug:'cow-hollow'},{name:'Union Street',slug:'union-street'},{name:'Marina',slug:'marina'},{name:'Telegraph Hill',slug:'telegraph-hill'},{name:'Downtown Union Square',slug:'downtown-union-square'},{name:'Tenderloin',slug:'tenderloin'},{name:'Civic Center',slug:'civic-center'},{name:'Hayes Valley',slug:'hayes-valley'},{name:'Alamo Square',slug:'alamo-square'},{name:'Panhandle',slug:'panhandle'},{name:'Haight Ashbury',slug:'haight-ashbury'},{name:'Lower Haight',slug:'lower-haight'},{name:'Mint Hill',slug:'mint-hill'},{name:'Duboce Triangle',slug:'duboce-triangle'},{name:'Cole Valley',slug:'cole-valley'},{name:'Rincon Hill',slug:'rincon-hill'},{name:'South Beach',slug:'south-beach'},{name:'South Of Market',slug:'south-of-market'},{name:'Showplace Square',slug:'showplace-square'},{name:'Mission Bay',slug:'mission-bay'},{name:'Yerba Buena Island',slug:'yerba-buena-island'},{name:'Treasure Island',slug:'treasure-island'},{name:'Mission Dolores',slug:'mission-dolores'},{name:'Castro',slug:'castro'},{name:'Outer Sunset',slug:'outer-sunset'},{name:'Parkside',slug:'parkside'},{name:'Stonestown',slug:'stonestown'},{name:'Parkmerced',slug:'parkmerced'},{name:'Lakeshore',slug:'lakeshore'},{name:'Golden Gate Heights',slug:'golden-gate-heights'},{name:'Forest Hill',slug:'forest-hill'},{name:'West Portal',slug:'west-portal'},{name:'Clarendon Heights',slug:'clarendon-heights'},{name:'Midtown Terrace',slug:'midtown-terrace'},{name:'Laguna Honda',slug:'laguna-honda'},{name:'Upper Market',slug:'upper-market'},{name:'Dolores Heights',slug:'dolores-heights'},{name:'Mission',slug:'mission'},{name:'Potrero Hill',slug:'potrero-hill'},{name:'Dogpatch',slug:'dogpatch'},{name:'Central Waterfront',slug:'central-waterfront'},{name:'Diamond Heights',slug:'diamond-heights'},{name:'Fairmount',slug:'fairmount'},{name:'Peralta Heights',slug:'peralta-heights'},{name:'Holly Park',slug:'holly-park'},{name:'Merced Manor',slug:'merced-manor'},{name:'Balboa Terrace',slug:'balboa-terrace'},{name:'Ingleside',slug:'ingleside'},{name:'Merced Heights',slug:'merced-heights'},{name:'Outer Mission',slug:'outer-mission'},{name:'Ingleside Terraces',slug:'ingleside-terraces'},{name:'Mt Davidson Manor',slug:'mt-davidson-manor'},{name:'Monterey Heights',slug:'monterey-heights'},{name:'Westwood Highlands',slug:'westwood-highlands'},{name:'Westwood Park',slug:'westwood-park'},{name:'Miraloma Park',slug:'miraloma-park'},{name:'Crocker Amazon',slug:'crocker-amazon'},{name:'Mclaren Park',slug:'mclaren-park'},{name:'Sunnydale',slug:'sunnydale'},{name:'Visitacion Valley',slug:'visitacion-valley'},{name:'India Basin',slug:'india-basin'},{name:'Hunters Point',slug:'hunters-point'},{name:'Candlestick Point Sra',slug:'candlestick-point-sra'},{name:'Northern Waterfront',slug:'northern-waterfront'},{name:'Cayuga',slug:'cayuga'},{name:'Oceanview',slug:'oceanview'},{name:'Apparel City',slug:'apparel-city'},{name:'Bernal Heights',slug:'bernal-heights'},{name:'Noe Valley',slug:'noe-valley'},{name:'Produce Market',slug:'produce-market'},{name:'Bayview',slug:'bayview'},{name:'Silver Terrace',slug:'silver-terrace'},{name:'Bret Harte',slug:'bret-harte'},{name:'Little Hollywood',slug:'little-hollywood'},{name:'Portola',slug:'portola'},{name:'University Mound',slug:'university-mound'},{name:'St Marys Park',slug:'st-marys-park'},{name:'Mission Terrace',slug:'mission-terrace'},{name:'Excelsior',slug:'excelsior'},{name:'Sunnyside',slug:'sunnyside'},{name:'Glen Park',slug:'glen-park'},{name:'Aquatic Park Ft Mason',slug:'aquatic-park-ft-mason'},{name:'Fishermans Wharf',slug:'fishermans-wharf'},{name:'Cathedral Hill',slug:'cathedral-hill'},{name:'Japantown',slug:'japantown'},{name:'Pacific Heights',slug:'pacific-heights'},{name:'Lower Pacific Heights',slug:'lower-pacific-heights'},{name:'Western Addition',slug:'western-addition'},{name:'Chinatown',slug:'chinatown'},{name:'Nob Hill',slug:'nob-hill'},{name:'Lower Nob Hill',slug:'lower-nob-hill'},{name:'Polk Gulch',slug:'polk-gulch'},{name:'North Beach',slug:'north-beach'},{name:'Russian Hill',slug:'russian-hill'},{name:'Financial District',slug:'financial-district'},{name:'Inner Sunset',slug:'inner-sunset'},{name:'Parnassus Heights',slug:'parnassus-heights'},{name:'Forest Knolls',slug:'forest-knolls'},{name:'Buena Vista',slug:'buena-vista'},{name:'Corona Heights',slug:'corona-heights'},{name:'Ashbury Heights',slug:'ashbury-heights'},{name:'Eureka Valley',slug:'eureka-valley'},{name:'St Francis Wood',slug:'st-francis-wood'},{name:'Sherwood Forest',slug:'sherwood-forest'}]
simpleHoods=[{name:"Seacliff",slug:"seacliff"},{name:"Haight Ashbury",slug:"haight-ashbury"},{name:"Outer Mission",slug:"outer-mission"},{name:"Russian Hill",slug:"russian-hill"},{name:"Noe Valley",slug:"noe-valley"},{name:"Inner Sunset",slug:"inner-sunset"},{name:"Downtown-Civic-Center",slug:"downtown-civic-center"},{name:"Diamond Heights",slug:"diamond-heights"},{name:"Lakeshore",slug:"lakeshore"},{name:"Outer Richmond",slug:"outer-richmond"},{name:"Crocker Amazon",slug:"crocker-amazon"},{name:"Excelsior",slug:"excelsior"},{name:"Parkside",slug:"parkside"},{name:"Financial District",slug:"financial-district"},{name:"Ocean View",slug:"ocean-view"},{name:"Mission",slug:"mission"},{name:"West of Twin Peaks",slug:"west-of-twin-peaks"},{name:"Inner Richmond",slug:"inner-richmond"},{name:"Marina",slug:"marina"},{name:"Bayview",slug:"bayview"},{name:"Visitacion Valley",slug:"visitacion-valley"},{name:"Pacific Heights",slug:"pacific-heights"},{name:"Presidio",slug:"presidio"},{name:"Nob Hill",slug:"nob-hill"},{name:"Outer Sunset",slug:"outer-sunset"},{name:"Western Addition",slug:"western-addition"},{name:"Golden Gate Park",slug:"golden-gate-park"},{name:"Presidio Heights",slug:"presidio-heights"},{name:"South of Market",slug:"south-of-market"},{name:"Glen Park",slug:"glen-park"},{name:"Potrero Hill",slug:"potrero-hill"},{name:"Castro-Upper-Market",slug:"castro-upper-market"},{name:"Twin Peaks",slug:"twin-peaks"},{name:"Bernal Heights",slug:"bernal-heights"},{name:"Chinatown",slug:"chinatown"},{name:"North Beach",slug:"north-beach"}];

Neighborhood.delete_all
Neighborhood.create(simpleHoods)

# AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')


# Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Alamo Square')
# Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Panhandle')
# Bikeroute.find_by( name: 'The Wiggle').neighborhoods << Neighborhood.find_by( name: 'Haight Ashbury')
# routes[3].neighborhoods << Neighborhood.find_by( name: 'Alamo Square')
# routes[0].neighborhoods << Neighborhood.find_by( name: 'Panhandle')
# routes[3].neighborhoods << Neighborhood.find_by( name: 'Panhandle')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'Tenderloin')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'Downtown Union Square')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'Civic Center')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'South Of Market')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'Northern Waterfront')
# routes[2].neighborhoods << Neighborhood.find_by( name: 'Northern Waterfront')
# routes[1].neighborhoods << Neighborhood.find_by( name: 'Financial District')
# routes[2].neighborhoods << Neighborhood.find_by( name: 'Financial District')
# routes[3].neighborhoods << Neighborhood.find_by( name: 'Haight Ashbury')
