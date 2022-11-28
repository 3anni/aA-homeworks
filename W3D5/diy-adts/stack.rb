class Stack
    def initialize
      # create ivar to store stack here!
      @stk = Array.new()
    end

    def push(el)
      # adds an element to the stack
      @stk.push(el)
    end

    def pop
      # removes one element from the stack
      @stk.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stk[-1]
    end
end


s = Stack.new

s.push(3)
p s.peek # 3

s.push(5)
p s.peek # 5

s.push(8)
p s.peek # 8
p s.pop # 8
p s.peek # 5
p s.pop # 5
p s.peek # 3
p s.pop # 3
