require 'pry'
class BankAccount

    attr_accessor :balance, :status
    attr_reader :name, :all

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def deposit(num)
        @balance += num
    end

    def self.all
        @@all
    end

    def display_balance
        return "Your balance is $#{@balance}." 
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @status = "closed"
    end
end
