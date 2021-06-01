class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/pizzas/) && req.get?
      pizza_json = pizza.all.to_json()
      return [200, { 'Content-Type' => 'application/json' }, [ pizza_json ]]

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end

