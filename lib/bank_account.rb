class BankAccount # BankAccount BankAccount #initialize can initialize a Bank Account
  attr_accessor :balance, :status
  attr_reader :name
  # BankAccount BankAccount #initialize initializes with a name
  def initialize(name)
    # BankAccount BankAccount #initialize initializes with a name
    @name = name
    # BankAccount BankAccount #initialize always initializes with balance of 1000
    @balance = 1000
    # BankAccount BankAccount #initialize always initializes with a status of 'open'
    @status = 'open'
  end
  # BankAccount #deposit can deposit money into its account
  def deposit(amount)
    @balance += amount
  end
  # BankAccount #display_balance can display its balance
  def display_balance
    "Your balance is $#{@balance}."
  end
  # BankAccount #valid? is valid with an open status and a balance greater than 0
  def valid?
    @status == 'open' && @balance > 0
  end
  # BankAccount #close_account can close its account
  def close_account
    @status = 'closed'
  end
end
