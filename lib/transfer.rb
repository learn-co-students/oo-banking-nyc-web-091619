class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && valid? && sender.balance > amount
      # binding.pry
      sender.balance-=@amount
      receiver.balance+=@amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # binding.pry
    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete" 
      sender.balance+=self.amount
      receiver.balance-=self.amount
      self.status = "reversed"
    end
    # binding.pry
  end


end


# b1 = BankAccount.new()
# b1.valid? is true