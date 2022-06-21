class Application
    @@items = [Item.new("Apples", 1), Item.new("Carrots", 2), Item.new("Pears", 3)]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        item = req.path.split("/items/").last
        found_item = @@items.find {|i| i.name == item}
        if found_item
            resp.write found_item.price
          else 
            resp.status = 400
            resp.write "Item not found"
          end
      else
        resp.status = 404
        resp.write "Route not found"
      end
  
      resp.finish
    end
  
  
  end
  