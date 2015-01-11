class MessageBoxesController < ApplicationController
  before_action :set_message_box, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @inbox_messages = MessageBox.inbox
    logger.debug '*********INBOX********'
    respond_with(@inbox_messages)
  end

  def sent
    @sent_messages  = MessageBox.sent
    respond_with(@sent_messages)
  end

  def trash
    @trash_messages = MessageBox.trash
    respond_with(@trash_messages)
  end

  def show
    logger.debug '*********SHOW********'
    logger.debug @message_box.inspect
    ref = params[:ref].to_s
    logger.debug 'This is show+'+ref
    if ref=='inbox'
      rid = params[:rid]
      @receipt  = Recipient.find(rid)
      logger.debug @receipt.inspect
      @receipt.update_attribute(:is_read, true)
      logger.debug @receipt.inspect
    elsif ref=='sent'
    end
    respond_with(@message_box, ref)
  end

  def new
    @message_box = MessageBox.new
    @public_names = User.select('id, public_name').order('public_name ASC')
    respond_with(@message_box)
  end

  def edit
  end

  def create
    @message_box = MessageBox.new(message_box_params)
    logger.debug '*********CREATE********'
    logger.debug @message_box.inspect

    @rec_public_names=@message_box.recipients_pnames.to_s.delete(' ').split(',')

    if(convert_pnames_to_ids(@rec_public_names).size<@rec_public_names.size)
      flash.now.alert='Wrong public name(s).'
      render 'new'
    else
      logger.debug @message_box.recipients_ids
      @message_box.save
      respond_with(@message_box)
    end
  end

  def update
    @message_box.update(message_box_params)
    respond_with(@message_box)
  end

  def destroy
    #@message_box.destroy
    @message = @message_box
    logger.debug '*********DESTROY********'
    logger.debug @message.inspect
    if params[:ref]=='inbox'
      #User.select('id, public_name').order('public_name ASC')
      @recipient = Recipient.where('message_box_id='+@message_box.id.to_s+' AND user_id='+User.current.id.to_s).first
      logger.debug @recipient.inspect
      @recipient.update_attribute(:is_deleted, true)
    end
    @inbox_messages = MessageBox.inbox
    respond_with(@inbox_messages)
  end

  def moveToTrash
    logger.debug '********TRASH*******'
    @receipt  = Recipient.find(params[:rid].to_s)
    logger.debug @receipt.inspect
    @receipt.update_attribute(:is_deleted, true)
    logger.debug @receipt.inspect
    @inbox_messages = MessageBox.inbox
    redirect_to message_boxes_url
  end

  private
  def set_message_box
    @message_box = MessageBox.find(params[:id])
  end

  def message_box_params
    params.require(:message_box).permit(:sender_id, :recipient_id, :subject, :body, :conversation_id, :recipients_pnames)
  end

  def convert_pnames_to_ids(pnames)
    logger.debug '[CONVERT] '+pnames.inspect
    logger.debug '[CONVERT] '+User.select(:id).where(:public_name => pnames).inspect
    @message_box.recipients_ids = User.select(:id).where(:public_name=>pnames)
  end
end
