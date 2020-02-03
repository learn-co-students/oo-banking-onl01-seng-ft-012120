class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    self.status= 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance > self.amount
  end

  def execute_transaction
    if self.valid? && self.status == 'pending'
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status ='complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  require 'pry'
  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status ='reversed'
    end
  end



end
