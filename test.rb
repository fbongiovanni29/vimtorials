
rb = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0]]
md = ['tut_one.md', 'tut_two.md', 'tut_three.md']

if VIM::Window.current == VIM::Window[1] 
	VIM.command("wincmd h")
	VIM.command("ruby load 'test.rb'")
end

page = VIM::Buffer.current
page = page.name.split('/').last
elem = rb.index(page)
VIM.command("vertical resize 75")
VIM.command("vi #{rb[(elem+1)%3]}")
VIM.command("wincmd l")
VIM.command("vi #{md[(elem+1)%3]}")
VIM.command("wincmd h")

if rb[elem].split('.')[1].to_s == "open"
	`open #{rb[elem]}`
end

