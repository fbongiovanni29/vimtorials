file = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0]]
page = VIM::Buffer.current
page = page.name.split('/').last
if page == "README.md"	
	VIM.command("vi tut_one.md")
	VIM.command("vs")
	VIM.command("vertical resize 75")
	VIM.command("vi #{Dir["one.*"][0]}")
	VIM.command("wincmd h")
end

if VIM::Window.current == VIM::Window[1] 
	VIM.command("wincmd h")
	VIM.command("ruby load 'test.rb'")
end

elem = file.index(page)
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md']

VIM.command("vertical resize 75")
VIM.command("vi #{file[(elem+1)%3]}")
VIM.command("wincmd l")
VIM.command("vi #{tut[(elem+1)%3]}")
VIM.command("wincmd h")

if file[elem].split('.')[1].to_s == "open"
	`open #{file[elem]}`
end

