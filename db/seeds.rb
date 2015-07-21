puts "********Seeding Data Start************"

# To seed schools data
school = School.find_by_name('University Of Hyderabad') || School.create(
  name:     'university of hyderabad',
  aka:      'uoh',
  address:  'no where',
  city:     'hyderabad',
  category: 'university',
  state:    'TS',
  user_id:   '1',
  remote_school_logo_url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8WY1dDtT8v_8E5Be9GGC7475gaunG9-849YoGUiiMXcs8lgjFU4NkDg',
  website:    'https://www.uohyd.ac.in/',
  estd:       '1974'
)
Review.find_by_school_id(school.id) || Review.create(
    headline:   'this is one good institute',
    faculty_expertise: 4.0,
    faculty_communication: 3.0,
    cost_worth: 3.4,
    transport: 3.4,
    library: 3.4,
    satisfaction_rate: 3.4,
    infrastructure: 3.4,
    sports: 3.4,
    research: 3.4,
    any_comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore, qui",
    is_approved: true,
    user_id: 1,
    school_id: school.id
)

school = School.find_by_name('Delhi University') || School.create(
  name:     'delhi university',
  aka:      'du',
  address:  'new delhi',
  city:     'delhi',
  category: 'university',
  state:    'dl',
  user_id:   '1',
  remote_school_logo_url:'http://t1.gstatic.com/images?q=tbn:ANd9GcTAmA8Obk2jwXXGRPIIe1GHVOMGAqcdyWH-eBzJM1QMXKGIX1aRfQ',
  website:    'https://www.du.ac.in/',
  estd:       '1922'
)

Review.find_by_school_id(school.id) || Review.create(
    headline:   'You grow but will stress along the way.',
    faculty_expertise: 4.0,
    faculty_communication: 3.0,
    cost_worth: 3.4,
    transport: 3.4,
    library: 3.4,
    satisfaction_rate: 3.4,
    infrastructure: 3.4,
    sports: 3.4,
    research: 3.4,
    any_comments: "Being able to do what we like best, every pleasure is to be avoided. But in certain circumstances",
    is_approved: true,
    user_id: 2,
    school_id: school.id
)

school = School.find_by_name('vit university') || School.create(
    name:     'vit university',
    aka:      'VIT',
    address:  'Near Katpadi Rd',
    city:     'Vellore',
    category: 'university',
    state:    'tn',
    user_id:   '2',
    remote_school_logo_url:'https://upload.wikimedia.org/wikipedia/en/thumb/6/6c/Vellore_Institute_of_Technology_seal.svg/970px-Vellore_Institute_of_Technology_seal.svg.png',
    website:    'https://www.vit.ac.in/',
    estd:       '1984'
)

Review.find_by_school_id(school.id) || Review.create(
    headline:   'Moving at the speed of light, burn out is inevitable',
    faculty_expertise: 4.0,
    faculty_communication: 3.0,
    cost_worth: 3.4,
    transport: 2.0,
    library: 3.0,
    satisfaction_rate: 3.0,
    infrastructure: 2.5,
    sports: 1.5,
    research: 0.0,
    any_comments: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, ",
    is_approved: true,
    user_id: 3,
    school_id: school.id
)

school = School.find_by_name('University of Kerala') || School.create(
    name:     'University of Kerala',
    aka:      'KU',
    address:  'Palayam',
    city:     'Thiruvananthapuram',
    category: 'university',
    state:    'kl',
    user_id:   '2',
    remote_school_logo_url:'https://upload.wikimedia.org/wikipedia/en/9/9f/Logo_of_University_of_Kerala.png',
    website:    'https://www.keralauniversity.ac.in/',
    estd:       '1937'
)

Review.find_by_school_id(school.id) || Review.create(
    headline:'The best place I\'ve worked and also the most demanding',
    faculty_expertise: 4.0,
    faculty_communication: 3.0,
    cost_worth: 3.4,
    transport: 3.4,
    library: 3.4,
    satisfaction_rate: 3.4,
    infrastructure: 3.4,
    sports: 3.4,
    research: 3.4,
    any_comments: "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo facere possimus, omnis volupta",
    is_approved: true,
    user_id: 4,
    school_id: school.id
)

school = School.find_by_name('Sikkim Manipal University') || School.create(
    name:     'Sikkim Manipal University',
    aka:      'SMU',
    address:  '2074, Vijaya Nagar Colony',
    city:     'Sadashiv Peth, Pune',
    category: 'university',
    state:    'mh',
    user_id:   '5',
    remote_school_logo_url:'http://www.lancaster.ac.uk/media/lancaster-university/content-assets/images/international/study-abroad/transfer-programmes/logomanipal.jpg',
    website:    'https://www.smude.edu.in/',
    estd:       '1995'
)

Review.find_by_school_id(school.id) || Review.create(
    headline:'You grow along with stree',
    faculty_expertise: 1.0,
    faculty_communication: 1.0,
    cost_worth: 4.4,
    transport: 2.4,
    library: 1.4,
    satisfaction_rate: 4.4,
    infrastructure: 4.4,
    sports: 1.4,
    research: 1.4,
    any_comments: "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo facere possimus, omnis volupta",
    is_approved: true,
    user_id: 4,
    school_id: school.id
)

puts "********Seeding Data End************"
