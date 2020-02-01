require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || @sender.status != "open" || @receiver.status != "open"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already executed"

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
