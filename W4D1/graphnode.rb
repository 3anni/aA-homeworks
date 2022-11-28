# require 'byebug'

class GraphNode

    attr_reader :value

    attr_accessor :neighbors

    def self.bfs(starting_node, target_value)


        visited = []
        queue = [starting_node]

        until queue.empty?
            # debugger
            cur_node = queue.shift
            return cur_node if cur_node.value == target_value
            visited << cur_node

            cur_node.neighbors.each do |neighbor|
                unless visited.include?(neighbor)
                    queue << neighbor
                end
            end
        end

        return nil
    end

    def initialize(value)
        @value = value
        @neighbors = []
    end

    # def add_neighbor(node)
    #     @neighbors << node unless @neighbors.include?(node)
    # end



end



# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]
