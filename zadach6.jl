function main(r::Robot, mode::Integer)
    moves, c_nord, c_west = find_way(r::Robot)
    if mode == 1
        draw_border(r)
    else
        draw_by_coords(r, c_nord, c_west)
    end
    go_back(r, moves)
end

function find_way(r::Robot)
    moves = [[0, Nord]]
    c_nord, c_west = 0, 0
    while (!isborder(r, Nord) || !isborder(r, West))
        a, b = move_to_border(r, Nord)
        moves = vcat(a, moves)
        c_nord += b
        a, b = move_to_border(r, West)
        moves = vcat(a, moves)
        c_west += b
    end
    return moves, c_nord, c_west
end

function go_back(r::Robot, moves::Vector)
    for i in moves
        for j in 1:i[1]
            move!(r, i[2])
        end
    end
end

function move_to_border(r::Robot, side::HorizonSide)
    cou = 0
    while !isborder(r, side)
        cou += 1
        move!(r, side)
    end
    return [[cou, inverse_side(side)]], cou
end

function draw_border(r::Robot)
    for i in [Sud, Ost, Nord, West]
        putmarker!(r)
        while !isborder(r, i)
            move!(r, i)
            putmarker!(r)
        end
    end
end

function draw_by_coords(r::Robot, c_nord::Integer, c_west::Integer)
    cou_sud, cou_ost = 0, 0
    for i in [Sud, Ost, Nord, West]
        cou = 0
        while !isborder(r, i)
            if ((i == Sud && cou == c_nord) || (i == Ost && cou == c_west) || (i == Nord && cou == cou_sud - c_nord) || (i == West && cou == cou_ost - c_west))
                putmarker!(r)
            end
            cou += 1
            move!(r, i)
        end
        if i == Sud
            cou_sud = cou
        elseif i == Ost
            cou_ost = cou
        end
    end
end

function inverse_side(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4)) 
end