function main(r::Robot)
    draw_leafs(r)
end

function draw_leafs(r::Robot)
    for i in [[Sud, Nord], [Nord, Sud], [Ost, West], [West, Ost]]
        draw_leaf(r, i)
    end
end

function draw_leaf(r::Robot, sides::Vector)
    count = 0 
    putmarker!(r)
    while !isborder(r, sides[1])
        count += 1
        move!(r, sides[1])
        putmarker!(r)
    end
    while count != 0
        count -= 1
        move!(r, sides[2])
    end
end
