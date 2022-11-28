tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down",
  "left",  "left-up" ]

def slow_dance(tile, tiles_array)
  (0...tiles_array.length).each do |i|
    if tiles_array[i] == tile
      return i
    end
  end

  return nil
end

p slow_dance("up", tiles_array) # 0

p slow_dance("right-down", tiles_array) # 3


new_tiles_data_structure = {"up"=>0,
              "right-up"=>1,
              "right"=>2,
              "right-down"=>3,
              "down"=>4,
              "left-down"=>5,
              "left"=>6,
              "left-up"=> 7}

def fast_dance(tile, tiles_hash)
  tiles_hash[tile]
end

p fast_dance("up", new_tiles_data_structure) # 0

p fast_dance("right-down", new_tiles_data_structure) #3
