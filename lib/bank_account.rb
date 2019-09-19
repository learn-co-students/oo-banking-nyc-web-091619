class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}." #@name outputs Avi which is correct but @balance puts nil, @balance not a method of name
    end

    def valid?
        #is valid if @status = open == true && @balance > 0
        (@balance > 0 && @status == "open")
    end

    def close_account
        @status = "closed"
    end


end
