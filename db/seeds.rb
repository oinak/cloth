# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
  [
    { username: 'admin', password: 'secret' },
    { username: 'jane', password: '123456' }
  ]
)

Garment.create!(
  [
    { sku:   '000_001',
      name:  'Lumberjack Flannel',
      color: 'red',
      kind:  'men shirt',
      size:  'xxl',
      brand: 'Timberland',
      price: Money.new(2350) },
    { sku:   '000_002',
      name:  'Forefather jeans',
      color: 'denim blue',
      kind:  'jean trourers',
      size:  'xl',
      brand: 'Levi Staruss',
      price: Money.new(4995) },
    { sku:   '000_003',
      name:  'Seven Leight Boots',
      color: 'maroon',
      kind:  'travel boots',
      size:  '45',
      brand: 'Prancing Pony',
      price: Money.new(9900) }
  ]
)
