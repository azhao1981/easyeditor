# -*- encoding : utf-8 -*-
def require_r(path) require(File.expand_path(path.to_s, File.dirname(__FILE__))) end

require_r "easyeditor/version"
require 'pathname'
require "ap"

module Easyeditor
	class EasyEditor
		attr_accessor :match_files
		def initialize(path,editor="vim")
			@editor =  editor
			@match_files = []
			path_a = path.split('/')
			@file_name = path_a.delete_at(-1)
			@match_str = path_a.join(".*/.*")
			match_paths
			return self
		end  
		def open
			@open_file = open_file
			puts "Now Run #{@editor} #{@open_file}"
			exec "#{@editor} #{@open_file}"
		end
		def open_file
			if @match_files.length > 1
				ap @match_files	
				puts "Which one to open:"
				@index = $stdin.gets.to_i 
			end
			select_file(@index)
		end
		def select_file(index = 0)
			@match_files[index || 0]	
		end
		def match_paths
			traverse_dir('.') do |file|
				@match_files << file if is_match?(file)
			end
			@match_files
		end
		def is_match?(file)
			/#{@match_str}/.match(file) && /#{@file_name}.*/.match(File.basename(file))
		end
		def traverse_dir(file_path)  
			if File.directory? file_path  
				Dir.foreach(file_path) do |file|  
					if file!="." and file!=".."  
						traverse_dir(file_path+"/"+file){|x| yield x}  
					end  
				end  
			else  
				yield  file_path  
			end  
		end
	end
end
