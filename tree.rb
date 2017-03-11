class Node
  attr_accessor :value, :left_node, :right_node

  def initialize(value=nil)
    @value = value
    @left_node = nil
    @right_node = nil
  end

end

class Tree
  attr_reader :root

  def initialize(value=nil)
    @root = Node.new value
  end

  def build_tree(array)  #assumption: array is sorted
    array.each do |value|
      current_node = find_current_node_for value

      new_node = Node.new value
      value <= current_node.value ? (current_node.left_node = new_node) : (current_node.right_node = new_node)
    end
  end

  def find_current_node_for(given_value)
    current_node = @root
    while true
      if given_value <= current_node.value
        break if current_node.left_node.nil?
        current_node = current_node.left_node
      else
        break if current_node.right_node.nil?
        current_node = current_node.right_node
      end
    end
    return current_node
  end

  def show_tree(current_node=@root, result=[])
    show_tree(current_node.left_node, result) unless current_node.left_node.nil?
    result << current_node.value
    show_tree(current_node.right_node, result) unless current_node.right_node.nil?
    return result
  end
end
