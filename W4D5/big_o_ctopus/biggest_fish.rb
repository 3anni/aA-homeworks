require 'byebug'

def sluggish_octopus(arr)
  largest = arr[0]

  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      fish1, fish2 = arr[i], arr[j]
      # debugger
      if fish1.length > fish2.length && fish1.length > largest.length
        largest = fish1
      elsif fish2.length > fish1.length && fish2.length > largest.length
        largest = fish2
      end
    end
  end

  largest
end

def dominant_octopus(arr)
  return nil if arr.length ==0
  return arr.first if arr.length == 1

  # debugger
  pivot = arr.sample
  right = arr.select {|el| el.length >= pivot.length}

  dominant_octopus(right)
end

def clever_octopus(arr)
  longest = arr.first
  arr.each { |el| longest = el if el.length > longest.length }
  longest
end





arr = ['fish', 'fiiish', 'fiiiiish',
  'fiiiish', 'fffish',
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p 'sluggish_octopus'
p sluggish_octopus(arr)

p 'dominant_octopus'
p dominant_octopus(arr)

p 'clever_octopus'
p clever_octopus(arr)
