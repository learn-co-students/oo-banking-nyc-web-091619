require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    sender.balance -= amount
    receiver.balance += amount

    #check that everyone's account is ok & this transaction hasn't happened before
    if @@all.include?(self) || !sender.valid? || !receiver.valid?  then
      self.status = "rejected"
      sender.balance += amount
      receiver.balance -= amount
      "Transaction rejected. Please check your account balance."

    #successful transaction case
    else
      self.status = "complete"
      @@all << self
    end
  end

  def reverse_transfer
    if  self.status == "complete"
      self.status = "reversed"
      sender.balance += amount
      receiver.balance -= amount
    end
  end

  def self.all
    @@all
  end

end
