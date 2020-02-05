class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      return "Transaction rejected. Please check your account balance"
      self.status = "rejected"
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    end
  end

end
