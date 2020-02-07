require 'pry'
class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    end
  end
  
  def execute_transaction
    if self.valid?
      if sender.balance >= amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
  end  
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
  
end
