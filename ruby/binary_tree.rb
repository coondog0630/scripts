# == Description
# A quick Binary tree representation in ruby.
#
# ::Author:: Sahil R Cooner
# ::Version:: 0.1-alpha

class Tree
  attr_accessor :left, :right, :data

  def initialize(x=nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    list = []
    if @data == nil
      @data = x
    elsif @left == nil
      @left = Tree.new(x)
    elsif @right == nil
      @right = Tree.new(x)
    else
      list << @left
      list << @right
      loop do
        node = list.shift
        if node.left == nil
          node.insert(x)
          break
        else
          list << node.left
        end
        if node.right == nil
          node.insert(x)
          break
        else
        list << node.right
        end
      end
    end
  end

  def traverse
    list = []
    yield @data
    list << @left if @left != nil
    list << @right if @right != nil
    loop do
      break if list.empty?
      node = list.shift
      yield node.data
      list << node.left if node.left != nil
      list << node.right if node.right != nil
    end
  end

  def inorder
    @left.inorder { |y| yield y } if @left != nil
    yield @data
    @right.inorder { |y| yield y } if @right != nil
  end

  def preorder
    yield @data
    @left.preorder { |y| yield y } if @left != nil
    @right.preorder { |y| yield y } if @right != nil
  end

  def postorder
    @left.postorder { |y| yield y } if @left != nil
    @right.postorder { |y| yield y } if @right != nil
    yield @data
  end
end

# Testing
# items = [1, 2, 3, 4, 5, 6, 7]
# tree = Tree.new
# items.each { |x| tree.insert(x) }
# tree.traverse { |x| print "#{x} "}
# print "\n"

# tree.inorder { |x| print x, " " }
# print "\n"
# tree.preorder { |x| print x, " " }
# print "\n"
# tree.postorder { |x| print x, " "}
# print "\n"
