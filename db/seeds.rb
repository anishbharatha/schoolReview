School.find_by_name('University Of Hyderabad') || School.create(
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

School.find_by_name('Delhi University') || School.create(
  name:     'delhi university',
  aka:      'du',
  address:  'new delhi',
  city:     'delhi',
  category: 'university',
  state:    'dh',
  user_id:   '1',
  remote_school_logo_url:'http://t1.gstatic.com/images?q=tbn:ANd9GcTAmA8Obk2jwXXGRPIIe1GHVOMGAqcdyWH-eBzJM1QMXKGIX1aRfQ',
  website:    'https://www.du.ac.in/',
  estd:       '1922'
)

User.find_by_unconfirmed_email_with_errors('srinivasgumdelli@gmail.com') || User.create(
 email: 'tester@gmail.com',
 password: 'tester',
 password_confirmation: 'tester'
)
