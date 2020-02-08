require 'pry' 
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)  
    @sender = sender 
    @receiver = receiver
    @status = "pending" 
    @amount = amount 
  end   
  
  def valid? #check ther is a sender && receiver 
    @sender.valid? && @receiver.valid? 
  end   
  
  def execute_transaction #sender=amanda expect(sender.balance).to eq(950)
    if @sender.balance <= @amount || @sender.status != "open" || @receiver.status != "open" #!both accounts must be open, !the sender balance is >= amount being sent
      @status = "rejected"
      "Transaction rejected. Please check your account balance." #spec file 
    elsif @status == "complete" #spec file "complete" 
      "Complete"
    else #amount changes balance receiver & sender, change status to complete 
      @status = "complete"
      @sender.balance -= amount
      @receiver.balance += amount
    end   
  end 
  
  def reverse_transfer
    if @status == "complete" #can only reverse "complete" transfers
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end   
  end   
  
end
