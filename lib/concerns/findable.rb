module Findable #but the common methods aren't just the finding methods. 

  module InstanceMethods
    def initialize
      @@all << self
    end
  end

  module ClassMethods
    def self.find_by_title(title)
      self.all detect {|r| r.title}
    end

    def self.find_by_teacher(teacher)

    end

    def self.all
      @@all
    end
  end

end
