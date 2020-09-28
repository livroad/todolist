(1..10).each do |number|
  Dolist.create(status: 'test title ' + number.to_s, content: 'test content ' + number.to_s)
end