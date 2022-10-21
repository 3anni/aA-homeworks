class Map
    def initialize
        @m = Hash.new()
    end

    def set(key, value)
        @m[key] = value
    end

    def get(key)
        @m[key]
    end

    def delete(key)
        @m.delete(key)
    end

    def show
        @m
    end
end

m = Map.new

m.set("hey", 3)
m.set("hi", 2)
m.set("hello", 5)
p m.get("hello") # 5
p m.get("hey") # 3
p m.get("hi") # 2
m.set("hello", 8)
p m.get("hello") # 8
m.delete("hi")
p m.show
