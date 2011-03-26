class Item
  attr_accessor :name, :sellin, :quality
end

class ItemBase < Item
  def initialize(name, sellin, quality)
    @name = name
    @sellin = sellin
    @quality = quality
  end
  
  def update_quality
  end
  
  def update_sellin
  end
end