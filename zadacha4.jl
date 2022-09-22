function main(r::Robot)
    c_nord, c_west = get_to_border(r)
    draw_cross(r)
    get_to_corner(r)
    return_to_spawn(r, c_nord, c_west) 
end

function get_to_border(r::Robot)
    count_west = 0
    count_nord = 0
    while !isborder(r, West)
        move!(r, West)
        count_west += 1
    end
    while !isborder(r, Nord)
        move!(r, Nord)
        count_nord += 1
    end
    return count_nord, count_west
end

function get_to_corner(r::Robot)
    while !isborder(r, West)
        move!(r, West)
    end
    while !isborder(r, Nord)
        move!(r, Nord)
    end
 end

 function return_to_spawn(r::Robot, steps_sud::Integer, steps_ost::Integer)
    for i in 1:steps_sud
        move!(r, Sud)
    end
    for i in 1:steps_ost
        move!(r, Ost)
    end
end

function draw_cross(r::Robot)
    find_center(r)
    putmarker!(r)
    for i in [[Nord, Ost], [Nord, West], [Sud, Ost], [Sud, West]]
        draw_leaf(r, i)
    end
end

function find_center(r::Robot)
    count_hor = 0
    count_vert = 0
    while !isborder(r, Ost)
        count_hor += 1
        move!(r, Ost)
    end
    while !isborder(r, Sud)
        count_vert += 1
        move!(r, Sud)
    end
    while count_vert > 0
        count_vert -= 2
        move!(r, Nord)
    end
    while count_hor > 0
        count_hor -= 2
        move!(r, West)
    end
end

function draw_leaf(r::Robot, side::Array)
    count = 0
    while !isborder(r, side[1]) && !isborder(r, side[2])
        move!(r, side[1])
        move!(r, side[2])
        putmarker!(r)
        count += 1
    end
    while count != 0
        move!(r, inverse_side(side[1]))
        move!(r, inverse_side(side[2]))
        count -= 1
    end
end

function inverse_side(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4)) 
end
