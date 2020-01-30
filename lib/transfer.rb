class Transfer
  
    attr_accessor :status
    attr_reader :sender, :receiver, :amount 

    def initialize(sender, receiver, amount)
      @sender = sender 
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    #Can check that both accounts are valid
    #Calls on sender & receiver #valid? methods
    def valid?
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction
      if @sender.balance >= @amount && valid? && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
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
