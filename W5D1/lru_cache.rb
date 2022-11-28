class LRUCache

  def initialize(n)
    @dll = []
    @count = 0
    @capacity = n
  end

  # returns number of elements currently in cache
  def count
    @count
  end

  # adds element to cache according to LRU principle
  def add(el)
    if @dll.include?(el)
      idx = @dll.index(el)
      @dll.delete_at(idx)
    elsif available_capacity
      @count += 1
    else
      @dll.shift
    end
    @dll.push(el)
  end

  # shows the items in the cache, with the LRU item first
  def show
    p @dll
  end

  private
  # helper methods
  def available_capacity
    @capacity - @count > 0
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
