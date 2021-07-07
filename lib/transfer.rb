require 'pry'

class Transfer

    attr_reader :sender, :receiver, :amount
    attr_accessor :status
  
    def initialize(sender, receiver, status="pending", amount)
      @sender = sender 
      @receiver = receiver
      @status = status 
      @amount = amount
    end

    def valid?
      # Confirming that both accounts exist
      sender.valid? && receiver.valid?
    end

    def execute_transaction
      if valid? && sender.balance >= amount && self.status == "pending" 
        self.status = "complete"
        sender.balance -= amount
        receiver.balance += amount
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status != "pending"
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      end
    end


end
