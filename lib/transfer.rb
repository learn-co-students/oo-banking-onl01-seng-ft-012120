class Transfer
  # your code here
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true 
      
    else 
      return false
    end 
  end
  
  def reject_transfer
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end 
    
  def execute_transaction 
    if valid? && self.sender.balance > @amount && @status == "pending"
      self.sender.balance -= @amount 
      self.receiver.balance += @amount 
      @status = "complete"
      
    else 
      reject_transfer 
    end 
  end
  
  def reverse_transfer 
    if valid? && self.receiver.balance > @amount && @status == "complete"
      self.receiver.balance -= @amount 
      self.sender.balance += @amount 
      @status = "reversed"
      
    else 
      reject_transfer 
    end 
  end 
end
