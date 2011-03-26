require './item'

class NormalItem < ItemBase
  def update_quality
    if @sellin > 0 
      @quality = @quality - 1 if @quality > 0
      @quality = 0 if @quality < 0
    else
      @quality = @quality - 2 if @quality > 0
      @quality = 0 if @quality < 0
    end
  end
  
  def update_sellin
    @sellin = @sellin - 1
  end
end

class AgedBrie < ItemBase
  def update_quality
    # if @sellin > 0 
      @quality = @quality + 1 if @quality < 50
      @quality = 50 if @quality > 50
    # else
    #       @quality = @quality + 2 if @quality < 50
    #       @quality = 50 if @quality > 50
    #     end 
  end
  
  def update_sellin
    @sellin = @sellin - 1
  end
end

class Sulfuras < ItemBase
  
end

class BackstagePasses < ItemBase
  def update_quality
    @quality = @quality + 2 if @sellin <= 10 && @sellin > 5
    @quality = @quality + 3 if @sellin > 0  && @sellin <=5
    @quality = 0 if @sellin <= 0
  end
  
  def update_sellin
    @sellin = @sellin - 1
  end
end

class Conjured < NormalItem
  alias parent_update_quality update_quality
  def update_quality
    parent_update_quality
    parent_update_quality
  end
end