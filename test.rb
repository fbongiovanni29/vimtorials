
rb = ['one.rb', 'two.rb', 'three.rb']
md = ['one.md', 'two.md', 'three.md']


page = VIM::Buffer.current
page = page.name.split('/').last
elem = rb.index(page)
VIM.command("vertical resize 75")
VIM.command("vi #{rb[(elem+1)%3]}")
VIM.command("wincmd l")
VIM.command("vi #{md[(elem+1)%3]}")

VIM.command("wincmd h")
