function main(r::Robot)
    c_nord, c_west = get_to_border(r)
    draw_all(r)
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

function draw_all(r::Robot)
    while !isborder(r, Sud)
        draw_horizontal_line(r)
        move!(r, Sud)
    end
    draw_horizontal_line(r)
end

function draw_horizontal_line(r::Robot)
    while !isborder(r, Ost)
        putmarker!(r)
        move!(r, Ost)
    end
    putmarker!(r)
    while !isborder(r, West)
        move!(r, West)
    end
end