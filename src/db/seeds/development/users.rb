# frozen_string_literal: true

emails = ["hellotaro@example.com", "mikemike@example.com", "yesalexcan@example.com"]
passwords = ["passtaro", "mikepass", "alexword"]
names = ["\u592A\u90CE", "Mike", "Alex"]
descriptions = ["\u592A\u90CE\u3067\u3059\u3002\u3088\u308D\u3057\u304F\u3002", "I am Mike.", "Nothing"]

0.upto(2) do |i|
  User.create(
    email: emails[i],
    password: passwords[i],
    uuid: SecureRandom.uuid,
    name: names[i],
    description: descriptions[i]
  )
end
