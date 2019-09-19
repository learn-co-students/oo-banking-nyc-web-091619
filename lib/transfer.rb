require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    (self.valid? && @status != 'complete' && @sender.balance >= @amount) ? (@sender.deposit(-@amount); @receiver.deposit(@amount); @status = 'complete') : (@status = 'rejected';'Transaction rejected. Please check your account balance.')
  end
end # End transfer class
