
require_relative './recording.rb'

class Meditation

  include Recording::InstanceMethods
  extend Recording::ClassMethods

  attr_accessor :title, :teacher, :url, :date
  @@all = []
  
  def initialize(attributes_hash)
    #takes in hash of meditation attributes to build a meditation object
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    #access all the meditations
    @@all
  end

end
