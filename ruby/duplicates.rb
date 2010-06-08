#!/usr/bin/env ruby -w

require 'find'
require 'digest/md5'

def duplicate_sets(*p)
  sizes = {}
  
  Find.find(*p) do |f|
    (sizes[File.size(f)] ||= []) << f if File.file? f
  end
  
  sizes.each do |size, files|
    next unless file.size > 1
    md5s = []
    files.each do |f|
      digest = Digest::md5.hexdigest(File.read(f))
      (md5s[digest] ||= []) << f
    end
    md5s.each { |sum, files| yield files if files.size > 1}
  end
end

duplicate_sets(*ARGV) do |f|
  puts "Duplicates: #{f.join(",")}"
end