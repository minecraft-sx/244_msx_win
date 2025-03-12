local function depositItems()
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, 16 do
        turtle.select(i)
        turtle.drop()
    end
    turtle.turnRight()
    turtle.turnRight()
end

local function mineColumn()
    while turtle.detectDown() do
        turtle.digDown()
    end
    turtle.down()
end

local function mineLayer()
    for i = 1, 3 do
        for j = 1, 3 do
            if j < 3 then
                while turtle.detect() do
                    turtle.dig()
                end
                turtle.forward()
            end
        end
        if i < 3 then
            if i % 2 == 1 then
                turtle.turnRight()
                while turtle.detect() do
                    turtle.dig()
                end
                turtle.forward()
                turtle.turnRight()
            else
                turtle.turnLeft()
                while turtle.detect() do
                    turtle.dig()
                end
                turtle.forward()
                turtle.turnLeft()
            end
        end
    end
end

local function mineChunk(depth)
    for _ = 1, depth do
        mineLayer()
        mineColumn()
        if turtle.getItemCount(16) > 0 then
            depositItems()
        end
    end
end

print("Ingrese la profundidad del hueco: ")
local depth = tonumber(read())
if depth then
    mineChunk(depth)
    print("Hueco terminado.")
else
    print("Entrada inválida.")
end