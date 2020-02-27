
require "pry"
class BankAccount
  attr_accessor :balance,:status
 # attr_reader :name
  DEPOSIT = 1000
  def initialize(name)
    
    @name = name
    @balance =1000
    @status = "open"
   # @deposit = deposit
    
  end
       def name
    
          @name
    
       end

         def balance
  
             @balance
  binding.pry
         end

        def status
  
            @status
  
        end
        
        def deposit(amount)
           
          @balance = @balance + amount 
          # @deposit
       
        end
        
        def display_balance
          
          "Your balance is $#{@balance}."
          
        end
        
        def valid?
          
          if @status == "open" and balance > 0 
            
            true 
            
          else
            
            FALSE
        end
      end
      
      def close_account
        
        @status = "closed"
        
      end
end
