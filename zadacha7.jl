function main(r::Robot)
    find_hole(r)
end

function find_hole(r::Robot)
    side = West
    count = 1
    while isborder(r, Sud)
        side, count = move_side(r, side, count)
    end
    move!(r, Sud)
end

function move_side(r::Robot, side::HorizonSide, count::Integer)
    for i in 1:count
        move!(r, side)
    end
    return inverse_side(side), count + 1
end

function inverse_side(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4)) 
end
