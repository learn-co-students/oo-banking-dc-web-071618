require 'pry'
require_relative'./bank_account.rb'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount, status='pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid? && @amount <= @sender.balance
  end

  def execute_transaction
    if self.valid? && @status != 'complete'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
end
