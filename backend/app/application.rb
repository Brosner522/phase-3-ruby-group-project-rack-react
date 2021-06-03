class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/pizzas/) && req.get? 

      pizza = Pizza.all.to_json(:include => { :orders => {
          :include => :customer
      }}
    )
      return [200, { 'Content-Type' => 'application/json' }, [ pizza ]]

  elsif req.path.match(/topping/) && req.get? 

    topping = Topping.all.to_json

    return [200, { 'Content-Type' => 'application/json' }, [ topping ]]

  elsif req.path.match(/customer/) && req.get? 
    customer = Customer.all.to_json
    return [200, { 'Content-Type' => 'application/json' }, [ customer ]]

  elsif req.path.match(/customer/) && req.post? 
    customer_hash = JSON.parse(req.body.read)
 
    filter_customer = Customer.select do |customer|
      customer_hash == customer
    end

    if filter_customer.length > 0
      return [400, {} ["Path Not Found"]]
    else
      new_customer = Customer.create(customer_hash)
    return [201, { 'Content-Type' => 'application/json' }, [ new_customer]]
    end

    else
      resp.write "Path Not Found"
    end
    resp.finish
  end
end
