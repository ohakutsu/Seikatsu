emails = ['hellotaro@example.com', 'mikemike@example.com', 'yesalexcan@example.com']
passwords = ['passtaro', 'mikepass', 'alexword']
names = ['太郎', 'Mike', 'Alex']
descriptions = ['太郎です。よろしく。', 'I am Mike.', 'Nothing']

0.upto(2) do |i|
  User.create(
    email: emails[i],
    password: passwords[i],
    uuid: SecureRandom.uuid,
    name: names[i],
    description: descriptions[i]
  )
end