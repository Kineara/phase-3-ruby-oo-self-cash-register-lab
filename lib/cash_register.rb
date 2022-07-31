require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = [title, price, quantity]

        quantity.times do
            self.items << title
        end

        self.total += price * quantity
    end

    def apply_discount
        case discount
        when 0
            "There is no discount to apply."
        else
            self.total *= ((100.0 - self.discount) / 100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction 
        self.total -= (self.last_transaction[1] * self.last_transaction[2])
        self.last_transaction[2].times do
            self.items.pop
        end
    end

end
