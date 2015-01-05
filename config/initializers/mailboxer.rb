Mailboxer.setup do |config|

  #Configures the methods needed by mailboxer
  #config.email_method = :mailboxer_email
  #config.name_method = :name

  #Configures if you use or not a search engine and which one you are using
  #Supported engines: [:solr,:sphinx]
  config.search_enabled = false
  config.search_engine = :solr

  #Configures maximum length of the message subject and body
  config.subject_max_length = 255
  config.body_max_length = 32000

end
