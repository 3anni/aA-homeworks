class Queue

    def initialize
        @q = Array.new()
    end

    def enqueue(el)
        @q.push(el)
    end

    def dequeue
        @q.shift
    end

    def peek
        @q[0]
    end
end

q = Queue.new

q.enqueue(2)
p q.peek # 2

q.enqueue(4)
p q.peek # 2

q.enqueue(8)
p q.peek # 2

q.enqueue(3)
p q.peek # 2

q.dequeue
p q.peek # 4

q.dequeue
p q.peek # 8

q.dequeue
p q.peek # 3
