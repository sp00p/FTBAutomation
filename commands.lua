// This is the main file for the server which controls my turtles 
// You can read more about turtles and ComputerCraft here: https://www.computercraft.info

rednet.open("top")
term.write("What would you like the turtles to do: ")
message = io.read()
rednet.broadcast(message)
senderID, message, distance = rednet.recieve()
print(message)
