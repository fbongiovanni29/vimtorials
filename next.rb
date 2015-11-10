#Selects file in directory with filename and any extension
file = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0]]
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md']
#Sets the variable page to the current buffer
page = VIM::Buffer.current

#Splits page to extract just the filename from the full filepath
page = page.name.split('/').last

#Checks to see if it needs to start tutorial
if page == "README.md"	
	VIM.command("vi tut_one.md")
	VIM.command("vs")
	VIM.command("vertical resize 75")
	VIM.command("vi #{Dir["one.*"][0]}")
	VIM.command("wincmd h")
end

#Checks to see if the current window is on the right side
#If true switches to left side and reloads
if VIM::Window.current == VIM::Window[1] 
	VIM.command("wincmd h")
	VIM.command("ruby load 'next.rb'")
end

#Sets the file to the index of the current page
elem = file.index(page)
VIM.command("vertical resize 75")
VIM.command("vi #{file[(elem+1)%3]}")
VIM.command("wincmd l")
VIM.command("vi #{tut[(elem+1)%3]}")
VIM.command("wincmd h")

#if the file has file.open.ext open file
if file[elem].split('.')[1].to_s == "open"
	`open #{file[elem]}`
end

