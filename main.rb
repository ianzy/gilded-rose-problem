require './goods'

items = []
items << NormalItem.new("+5 Dexterity Vest", 10, 20)
items << AgedBrie.new("Aged Brie", 2, 0)
items << NormalItem.new("Elixir of the Mongoose", 5, 7)
items << Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80)
items << BackstagePasses.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
items << Conjured.new("Conjured Mana Cake", 3, 6)

items.each do |i|
  i.update_sellin
  i.update_quality
  puts i.name
  puts i.sellin
  puts i.quality
end