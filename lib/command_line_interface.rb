def welcome()
  # puts out a welcome message here!
  puts "Hi there, welcome to the Stars Wars character finder."

end

def get_character_from_user()
  puts "Please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end
