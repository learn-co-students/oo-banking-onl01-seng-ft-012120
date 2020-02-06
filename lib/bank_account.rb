class BankAccount
  attr_accessor :status, :balance
  attr_reader :name 
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end 
  
  def deposit(amount_of_money)
    @balance += amount_of_money
  end 
  
  def display_balance
    return "Your balance is $#{self.balance}."
  end 
  
  def valid?
    if self.balance > 0 && @status == "open"
      return true 
      
    else 
      return false
    end 
  end 
  
  def close_account
    @balance = 0 
    @status = "closed"
  end 
end
