require 'pry'

class BankAccount

#@@bank_account = []

  attr_reader :name
  attr_accessor :balance, :status, :transfer

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  #  @@bank_account = self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open"  && self.balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end
end
