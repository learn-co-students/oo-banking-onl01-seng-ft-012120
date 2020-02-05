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
    if @status == 'pending' && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status == 'complete'
    else
      'Transaction rejected. Please check your account balance.'
    end
  end
end
