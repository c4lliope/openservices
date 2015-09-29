require_relative "../import_helper"
require_relative "importer"
require "active_support/inflector"
require "yaml"

String.include ActiveSupport::Inflector

source = ImportHelper::read_source("apd/guide_2013.txt")
importer = PlainTextImporter.new(source)
data = importer.as_json
dir = "organizations"

data[:organizations].each do |org|
  filename = "#{dir}/#{org[:name].parameterize[0..100]}"
  extension = ".yml"

  while File.exist?(filename + extension)
    puts "Error! Duplicate file: #{filename}"
    filename = filename + "_dup"
    puts "Trying as #{filename}"
  end

  File.write(filename + ".yml", org.to_yaml)
end
