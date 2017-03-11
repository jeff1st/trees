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

  def build_tree(array)
    array.each do |value|
      current_node = find_eligible_node_for value

      new_node = Node.new value
      value <= current_node.value ? (current_node.left_node = new_node) : (current_node.right_node = new_node)
    end
  end

  def find_eligible_node_for(given_value)
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

  def bfs(value)
    nqueue = Queue.new
    current_node = @root
    nqueue << current_node

    while true
      current_node = nqueue.pop
      (result = "#{current_node.value}, left: #{!current_node.left_node.nil? ? (current_node.left_node.value) : ("nil")}, right: #{!current_node.right_node.nil? ? (current_node.right_node.value) : ("nil")}"; break) if value == current_node.value
      nqueue << current_node.left_node unless current_node.left_node.nil?
      nqueue << current_node.right_node unless current_node.right_node.nil?
      (result = nil; break) if nqueue.empty?
    end

    return result
  end

  def dfs(value)
    stack = Array.new
    current_node = @root
    stack << current_node

    while true
      current_node = stack.pop
      (result = "#{current_node.value}, left: #{!current_node.left_node.nil? ? (current_node.left_node.value) : ("nil")}, right: #{!current_node.right_node.nil? ? (current_node.right_node.value) : ("nil")}"; break) if value == current_node.value
      stack << current_node.right_node unless current_node.right_node.nil?
      stack << current_node.left_node unless current_node.left_node.nil?
      (result = nil; break) if stack.empty?
    end

    return result
  end

  def recurs_dfs(value, stack=[@root])
    return nil if stack.empty?
    current_node = stack.pop

    (result = "#{current_node.value}, left: #{!current_node.left_node.nil? ? (current_node.left_node.value) : ("nil")}, right: #{!current_node.right_node.nil? ? (current_node.right_node.value) : ("nil")}";return result) if value == current_node.value
    stack << current_node.right_node unless current_node.right_node.nil?
    stack << current_node.left_node unless current_node.left_node.nil?
    recurs_dfs(value, stack)
  end
end
