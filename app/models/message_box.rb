class MessageBox < ActiveRecord::Base
  has_many :recipients
  belongs_to :user
  before_create :set_conv_id, :set_sender
  after_create  :set_recipients_for_message
  attr_accessor :recipients_pnames  #To get list of recipients public names from view
  attr_accessor :recipients_ids     #To get list of recipients public names from view

  @connection = ActiveRecord::Base.connection

  def self.inbox
    @connection = ActiveRecord::Base.connection
    query_inbox = 'SELECT message_boxes.id, recipients.id AS rid, message_boxes.sender_id, users.public_name, message_boxes.subject, '+
        'message_boxes.body, recipients.user_id, recipients.is_read, recipients.is_deleted, '+
        'recipients.created_at FROM recipients, message_boxes, users WHERE '+
        'recipients.message_box_id=message_boxes.id AND users.id=message_boxes.sender_id AND '+
        'recipients.is_deleted IS FALSE AND recipients.user_id='+User.current.id.to_s+
        ' ORDER BY recipients.created_at DESC'

    Rails.logger.debug '*********INBOX MODEL********'
    Rails.logger.debug @connection.exec_query(query_inbox).first.inspect
    @connection.exec_query(query_inbox)
  end

  def self.sent
    query_sent = 'SELECT users.public_name, message_boxes.*, recipients.is_read, recipients.is_deleted FROM message_boxes, recipients, '+
            'users WHERE users.id=recipients.user_id AND recipients.message_box_id=message_boxes.id AND '+
            'message_boxes.sender_id='+User.current.id.to_s+' ORDER BY recipients.created_at DESC'
    @connection.exec_query(query_sent)
  end

  def self.trash
    query_trash = 'SELECT users.public_name, recipients.user_id, message_boxes.subject, message_boxes.created_at '+
            'FROM message_boxes, users, recipients WHERE recipients.message_box_id=message_boxes.id AND '+
            'message_boxes.sender_id=users.id and recipients.is_deleted=TRUE AND recipients.user_id='+User.current.id.to_s+
            ' ORDER BY created_at DESC'
    MessageBox.find_by_sql(query_trash)
  end

  private
  def set_conv_id
    Rails.logger.debug '****MODEL****'
    Rails.logger.debug self.inspect
    if MessageBox.all.size!=0
      @last_conv_id = MessageBox.select('conversation_id').order('conversation_id DESC').first
      self.conversation_id = @last_conv_id.conversation_id.to_i+1
    else
      self.conversation_id = 1;
    end
  end

  def set_sender
    self.sender_id  = User.current.id.to_i
  end

  def set_recipients_for_message
    Rails.logger.debug '*********MBMODEL************'
    Rails.logger.debug self.recipients_ids.inspect
    self.recipients_ids.each {
      |rec_id|
      Rails.logger.debug rec_id
      Recipient.create(message_box_id: self.id, user_id: rec_id.id)
    }
        #Recipient.create(message_box_id: self.id, user_id: recipient_id)
  end
end
