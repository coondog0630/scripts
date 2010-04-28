#!/usr/bin/env ruby

class File
  
=begin rdoc
  The +same_contents+ method compares to files at block level.
=end
  def File.same_contents(p1, p2)
    # Performing basic checks
    return false if File.exists?(p1) != File.exists?(p2)
    return true if !File.exists?(p1)
    return true if File.expand_path(p1) == File.expand_path(p2)
    return false if File.ftype(p1) != File.ftype(p2) || 
      File.size(p1) != File.size(p2)
      
    # Compare the files by block
    open(p1) { |f1|
      open(p2, "w") { |f2| 
        blocksize = f1.lstat.blksize
        same = true
        while same && !f1.eof? && !f2.eof?
          same = f1.read(blocksize) == f2.read(blocksize)
        end
        return same
      }
    }
    end
  end
end
