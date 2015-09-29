require "active_support"

module ImportHelper
  include ActiveSupport::Inflector

  def self.read_source(file)
    File.read(File.expand_path("../../../sources/#{file}", __FILE__))
  end
end
