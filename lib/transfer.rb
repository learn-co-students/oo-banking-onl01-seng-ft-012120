class Transfer
  attr_reader :sender, :receiver, :status
  attr_accessor :amount
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = transfer_amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if @status == 'pending' && self.valid? && sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end
  
  def reverse_transfer
    if @status == 'complete' && self.valid? && receiver.balance >= @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
