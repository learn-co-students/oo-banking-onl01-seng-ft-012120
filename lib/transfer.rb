require_relative './bank_account'

class Transfer
  # your code here
  attr_accessor :status, :amount, :transfer_amount, :sender, :receiver
  attr_reader

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @amount = amount
    @sender = sender
    @receiver = receiver 
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end 

  def execute_transaction
    if @sender.balance < @amount || !sender.valid? || !receiver.valid?
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    # elsif
    #   @receiver.balance += @amount
    #   @sender.balance -= @amount
    #   @status = "complete"
    elsif @status == "complete"
      "already transferred"
    elsif
      @receiver.balance += @amount
      @sender.balance -= @amount
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
