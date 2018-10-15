class Application

  @@items = []
  
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      if item
        resp.write item.price
      else
        resp.status = 400
        resp.write "We don't have this item"
    else
      resp.status = 404
    end
 
    resp.finish
  end
end
