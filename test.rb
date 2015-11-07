x = ['one.rb', 'two.rb', 'three.rb']


page = VIM::Buffer.current
#page = VIM.command("put =expand('%')")
page = page.name.split('/').last
elem = x.index(page)
puts elem
#VIM.command("vi #{x[1]}")
#VIM.command(":ruby load '#{x[2]}'")
VIM.command("vi #{x[(elem+1)]}")
#puts page+" is this page!"
#VIM.command('vi ":echo @%"')
