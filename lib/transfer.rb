require 'pry'

class Transfer
    
    attr_accessor :amount, :status, :sender, :receiver

    def initialize(sender, receiver, amount)
      @amount = amount
      @status = "pending"
      @sender = sender
      @receiver = receiver
    end

    def valid?
      (@sender.balance > 0 && @receiver.balance > 0)
      @sender.valid?
      @receiver.valid?
    end

    def execute_transaction
      if valid? && receiver.balance > amount && self.status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        reject_transfer
      end
      
    end
    
    def reject_transfer
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
    def reverse_transfer
      if self.status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      else
        reject_transfer
      end
      #binding.pry
    end
    
end
