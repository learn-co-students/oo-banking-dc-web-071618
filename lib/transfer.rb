class Transfer # Transfer Transfer initialize can initialize a Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    # Transfer Transfer initialize initializes with a sender
    @sender = sender
    # Transfer Transfer initialize initializes with a receiver
    @receiver = receiver
    # Transfer Transfer initialize always initializes with a status of 'pending'
    @status = 'pending'
    # Transfer Transfer initialize initializes with a transfer amount
    @amount = amount
  end
  # Transfer Transfer #valid? can check that both accounts are valid
  # Transfer Transfer #valid? calls on the sender and reciever's #valid? methods
  def valid?
    @sender.valid? && @receiver.valid?
  end
  # Transfer Transfer #execute_transaction can execute a successful transaction between two accounts
  # Transfer Transfer #execute_transaction each transfer can only happen once
  # Transfer Transfer #execute_transaction rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
    if self.valid? == true && @sender.balance > amount && @status == 'pending'
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  # Transfer Transfer #reverse_transfer can reverse a transfer between two accounts
  def reverse_transfer
    if @status == 'complete' # Transfer Transfer #reverse_transfer it can only reverse executed transfers
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end
end
