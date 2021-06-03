class Customer < ActiveRecord::Base
    has_many :orders
    has_many :pizzas, through: :orders

    
    def self.destroy(name)
        customerName = self.select do |customer|
            customer.name == name
        end.map do |customer|
            customer.destroy
        end
    end
    
end
