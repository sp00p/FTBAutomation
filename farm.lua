// The main farming file for my turtles

function getIntoPos()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
end

function refuel()
    if turtle.getFuelLevel() < 400 then
        turtle.select(1)
        turtle.refuel(1)
    end
end

function turnTurtle()
    if turtle.detectDown() == true then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        turtle.forward()
    elseif turtle.detectDown() == false then 
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
        turtle.forward()
    end 
end

function returnToHome()
    for i = 1,22 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.down()

    for i=2, 16 do
        turtle.select(i)
        turtle.drop()
    end 

    turtle.turnRight()

    for i=1,9 do
        turtle.forward()
    end 

    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.up()
    turtle.forward()
    turtle.turnRight()
    rednet.broadcast("Farming Turtle 1 has finished farming!")
end

function main()
    refuel()
    turtle.select(2)
    getIntoPos()
    for i = 1, 15 do
        for j = 1, 23 do
            local success, data = turtle.inspectDown()

            if data.metadata == 7 then 
                turtle.digDown()
                turtle.placeDown()
                turtle.forward()
            else 
                turtle.forward()
            end
        end
        turnTurtle()

    end
    returnToHome()
    turtle.select(1)
end 

main()
