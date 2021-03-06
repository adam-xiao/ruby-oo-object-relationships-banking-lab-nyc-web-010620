require 'pry'

class Transfer
  
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    #from miles and ty
    if !self.valid? || @status == "complete" || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
  

end
