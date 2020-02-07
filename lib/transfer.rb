class Transfer
  attr_accessor :sender, :receiver, :amount, :status
    def initialize(sender, receiver, amount = 50 )
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      if sender.status == "open" && sender.balance > 0 and receiver.status == "open" && receiver.balance > 0
        true
      else
        false
      end
      sender.valid?
      receiver.valid?
    end

    def execute_transaction

          if  sender.balance > @amount && @status =="pending"
            sender.balance -= @amount
            receiver.balance += @amount
              @status = "complete"
            else
              @status = "rejected"
              return "Transaction rejected. Please check your account balance."
          end
    end

    def reverse_transfer
      if @status == "complete"
        receiver.balance -= @amount
        sender.balance += @amount
        @status = "reversed"
      end
  end
end
