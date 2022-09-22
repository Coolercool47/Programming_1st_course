function main(r::Robot)
    moves_nord, moves_sud, moves_west = get_to_border(r)
    draw_border(r)
    get_to_inner_border(r)
    draw_inner_border(r)
    get_to_corner(r)
    return_to_spawn(r, moves_nord, moves_sud, moves_west)
 end
 
function get_to_border(r::Robot)
    moves = []
    count_west = 0
    count_nord = 0
    count_sud = 0
    while !isborder(r, Sud)
        move!(r, Sud)
        count_sud += 1
    end
    while !isborder(r, West)
        move!(r, West)
        count_west += 1
    end
    while !isborder(r, Nord)
        move!(r, Nord)
        count_nord += 1
    end
    return count_nord, count_sud, count_west
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

function return_to_spawn(r::Robot, moves_sud::Integer, moves_nord::Integer, moves_ost::Integer)
    for i in 1:moves_sud
        move!(r, Sud)
    end
    for i in 1:moves_ost
        move!(r, Ost)
    end
    for i in 1:moves_nord
        move!(r, Nord)
    end
end

function get_to_corner(r::Robot)
    while !isborder(r, West)
        move!(r, West)
    end
    while !isborder(r, Nord)
        move!(r, Nord)
    end
end

function get_to_inner_border(r::Robot)
    while !isborder(r, Sud)
        while !isborder(r, Ost)
            move!(r, Ost)
            if isborder(r, Sud)
                move!(r, West)
                return
            end
        end
        move!(r, Sud)
        while !isborder(r, West)
            move!(r, West)
        end
    end 
end

function draw_inner_border(r::Robot)
    for i in [[Sud, Ost], [Ost, Nord], [Nord, West], [West, Sud]]
        move!(r, i[1])
        putmarker!(r)
        while isborder(r, i[2])
            move!(r, i[1])
            putmarker!(r)
        end
    end
end