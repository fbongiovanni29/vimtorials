#Creates an array and finds the files ordered by numbers in plain text
#Sets file extension to REGEX * so it can load any file
file = [Dir["one.*"][0], Dir["two.*"][0], Dir["three.*"][0]]

#Finds the file path of the current buffer then splits it to extract just the basename
page = VIM::Buffer.current
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

#Gets the file at the index of page variable set earlier
elem = file.index(page)
tut = ['tut_one.md', 'tut_two.md', 'tut_three.md']

#Runs VIM commands to set window size, open file, switch window, open md file, and switch back
VIM.command("vertical resize 75")
VIM.command("vi #{file[(elem+1)%3]}")
VIM.command("wincmd l")
VIM.command("vi #{tut[(elem+1)%3]}")
VIM.command("wincmd h")

#if the file basename contains .open. it will launch the file
#through the bash open command
if file[elem].split('.')[1].to_s == "open"
	`open #{file[elem]}`
end

