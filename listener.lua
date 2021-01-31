// This is the file I use to make my turtles listen for rednet signals

rednet.open("left")
while true do
    senderID, message, distance = rednet.receive()
    if message == "exit" then
        break
    end
    rednet.broadcast("Farming Turtle 1 has started farming!")
    shell.run(message)
end
rednet.close("left")
