# -*- encoding : utf-8 -*-
def require_r(path) require(File.expand_path(path.to_s, File.dirname(__FILE__))) end

require_r "easyeditor/version"
require 'pathname'
require "ap"

module Easyeditor
	class EasyEditor
		attr_accessor :target_files
		def initialize(path,editor="vim")
			@editor =  editor
			@target_files = []
			parse_path(path)
			match_paths
			return self
		end
		def open
			if @target_files.length > 1
				ap @target_files	
				puts "Which file to open:[0-default]"
				@index = $stdin.gets.to_i 
			end
			exec "#{@editor} #{@target_files[@index || 0]}"
		end
		def parse_path(path)
			path_a = path.split('/')
			@filename_str = path_a.delete_at(-1)
			@path_str = path_a.join(".*/.*")
		end
		def match_paths
			traverse_dir('.') do |file|
				@target_files << file if is_match?(file)
			end
		end
		def is_match?(path)
			/#{@path_str}/.match(path) && /#{@filename_str}.*/.match(File.basename(path))
		end
		def traverse_dir(dir_path)  
			if File.directory? dir_path  
				Dir.foreach(dir_path) do |file|  
					if file!="." and file!=".."  
						traverse_dir(dir_path+"/"+file){|x| yield x}  
					end  
				end  
			else  
				yield  dir_path  
			end  
		end
	end
end
