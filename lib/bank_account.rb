class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(num)
        @balance += num
    end

    def display_balance
       "Your balance is $#{@balance}."
    end

    def valid?
        return true if (@status == "open" && @balance > 0)
        false
    end

    def close_account
        @status = "closed"
        @balance = 0
    end
end
