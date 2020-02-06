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
    if @sender.balance < @amount || @sender.status != "open" || @receiver.status != "open"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      "Transaction was already executed"

    else 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
