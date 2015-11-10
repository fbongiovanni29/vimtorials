#Selects file in directory with filename and any extension
file = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0]]
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md']
#Sets the variable page to the current buffer (Gets filename)
page = VIM::Buffer.current

#Splits page to extract just the filename from the full filepath
page = page.name.split('/').last

#Checks to see if the README is open and if so runs VIM commands to start tut
if page == "README.md"	
#VIM.command literally means this is a command being run by the vim :command
	VIM.command("vi tut_one.md")
	VIM.command("vs")
	VIM.command("vertical resize 75")
	VIM.command("vi #{Dir["one.*"][0]}")
	VIM.command("wincmd h")
end

#Checks to see if the current window is incorrect switches it back and outputs error
if VIM::Window.current == VIM::Window[1] 
	VIM.command("wincmd h")
	puts "Run command again incorrect window!"
end

#Sets the file to the index of the current page
elem = file.index(page)
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md', 'tut_four.md', 'tut_five.md']

#Runs VIM commands to set window size, open file, switch window, open md file, and switch back
VIM.command("vertical resize 75")
VIM.command("vi #{file[(elem+1)%5]}")
VIM.command("wincmd l")
VIM.command("vi #{tut[(elem+1)%5]}")
VIM.command("wincmd h")

#if the file has file.open.ext open file
#if the file basename contains .open. it will launch the file
#through the bash open command
if file[elem].split('.')[1].to_s == "open"
	`open #{file[elem]}`
end

