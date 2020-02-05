class Transfer
  attr_reader :sender, :receiver, :status
  attr_accessor :amount
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = transfer_amount
  end
end
