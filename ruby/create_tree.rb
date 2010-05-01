#!/usr/bin/env ruby
#
#
# == TODO
# * Create a datastructure from an existing file tree

=begin rdoc
  The +create_tree+ method creates a directory tree based on a data structure.
  === Parameters
  * _directories_ = Directories.
  * _parent_ = Parent directory (Default: current working directory).
  
  === Example
  create_tree 'test' => 
  [ 'File1',
    ['some', 'contents'],
    { 'Subdir' => ['empty file', 
                    ['nother file', 'some contents for it']]},
    { 'empty dir struct' => [] }
  ]
=end
def create_tree_from_struct(dirs, parent=".")
  dirs.each_pair do |dir, files|
    path = File.join(parent, dir)
    Dir.mkdir path unless File.exists? path
    files.each do |filename, contents|
      if filename.respond_to? :each_pair # sub dir
        create_tree filename, path
      else
        open(File.join(path, filename), 'w') { |f|
          f << contents || ""
        }
      end
    end
  end
end