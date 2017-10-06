class Stack
    def initialize
      @stack = []
    end

    def add(el)
      @stack.push(el)
    end

    def remove
      @stack.pop
    end

    def show
      @stack
    end
end


class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue
  end

end



class Map
attr_accessor :map

  def initialize
    @map = []
  end


  def assign(key,value)
    if lookup(key) == nil
      @map << [key,value]
    else
      @map.each {|pair| pair[1] = value if pair[0] == key}
    end

  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end


  def remove(key)
    @map.each_with_index do |pair,i|
      @map = @map.slice(0...i) + @map.slice(i+1..-1) if pair[0] == key
    end
  end

  def show
    @map
  end

end
