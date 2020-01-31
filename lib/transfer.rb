class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount
  end 
  
  def valid?
    if sender.valid? == true && receiver.valid? == true 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if @status == "complete" || @status == "rejected"
      "Transaction has already been executed."
    elsif !sender.valid? || !receiver.valid? || sender.balance <= amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif sender.balance >= amount && @status == "pending"
      sender.deposit(-amount) 
      receiver.deposit(amount)
      @status = "complete"
    end 
  end 
    
    def reverse_transfer
      if @status == "reversed"
        "This transaction has already beem reversed."
        
      elsif @status == "complete"
        sender.deposit(amount)
        receiver.deposit(-amount)
        @status = "reversed"
      end 
    end 
end
