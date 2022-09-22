function main(r::Robot)
   c_nord, c_west = get_to_border(r)
   draw_border(r)
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

function draw_border(r::Robot)
    putmarker!(r)
    for i in [Sud, Ost, Nord, West]
        while !isborder(r, i)
            move!(r, i)
            putmarker!(r)
        end
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
