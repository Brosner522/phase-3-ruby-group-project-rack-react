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

    else
      resp.write "Path Not Found"
    end
    resp.finish
  end
end
