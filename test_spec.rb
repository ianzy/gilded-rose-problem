require './goods'

describe NormalItem, "test normal item" do
  before(:each) do
    @item = NormalItem.new("whatever normal item", 10, 32)
  end
  
  it "should update sellin and quailty" do
    @item.update_sellin
    @item.update_quality
    
    @item.sellin.should == 9
    @item.quality.should == 31
  end
  
  it "should decrease twice as fast for normal item" do
    12.times do
      @item.update_sellin
      @item.update_quality
    end
    
    @item.sellin.should == -2
    @item.quality.should == 17
  end
end

describe AgedBrie, "test aged brie" do
  it "should increases in Quality the older it gets"
end

describe Sulfuras, "" do
  it "should be a legendary item, never has to be sold or decreases in Quality"
end

describe BackstagePasses, "test Backstage passes" do
  before(:each) do
    @item = BackstagePasses.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
  end
  
  it "should increases in Quality as SellIn value approaches" do  
    @item.update_sellin
    @item.update_quality
    @item.sellin.should == 14
    @item.quality.should >= 20
  end
  
  it "should Quality increases by 2 when there are 10 days or less" do
    4.times do
      @item.update_sellin
      @item.update_quality
    end
    @item.sellin.should == 11
    @item.quality.should == 20
    
    5.times do
      quality_of_last_day = @item.quality
      @item.update_sellin
      @item.update_quality
      @item.quality.should == quality_of_last_day + 2
    end
    
    5.times do
      quality_of_last_day = @item.quality
      @item.update_sellin
      @item.update_quality
      @item.quality.should == quality_of_last_day + 3
    end
    
    5.times do
      @item.update_sellin
      @item.update_quality
      @item.quality.should == 0
    end
  end
end

describe Conjured, "test Conjured" do
  it "should degrade in Quality twice as fast as normal items" do
    item = Conjured.new("Conjured Mana Cake", 3, 6)
    item.update_sellin
    item.update_quality
    
    item.sellin.should == 2
    item.quality.should == 4
  end
end