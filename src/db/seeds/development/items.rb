titles = [
  '日本語の勉強の仕方について',
  'How to learn Ruby on Rails',
  '水道凍結した場合の対処方法',
  '成績が上がるノートのとり方'
]
body = 'サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文サンプル本文'

0.upto(3) do |i|
  Item.create(
    uuid: SecureRandom.uuid,
    title: titles[i % 3],
    body: body,
    user_id: i % 3 + 1
  )
end