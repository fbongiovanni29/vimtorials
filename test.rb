x = ['one.rb', 'two.rb', 'three.rb']


page = VIM::Buffer.current
#page = VIM.command("put =expand('%')")
page = page.name.split('/').last
elem = x.index(page)
puts elem
VIM.command("ruby load '#{x[((elem+1)%3)]}'")
#puts page+" is this page!"
#VIM.command('vi ":echo @%"')
