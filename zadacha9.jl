function main(r::Robot)
    c_nord, c_west = get_to_border(r)
    from_start = Bool(1 - (c_nord + c_west) % 2)
    draw_all(r, 1, from_start)
    return_to_spawn(r, c_nord, c_west) 
 end
 
function draw_all(r::Robot, n::Integer, from_start::Bool)
    cou = 0
    flag = false
    while !flag
        cou += 1
        draw_line(r, n, from_start)
        if cou == n
            cou = 0
            from_start = !from_start
        end
        if isborder(r, Sud)
            flag = true
        else
            move!(r, Sud)
        end
    end
    while !isborder(r, Nord)
        move!(r, Nord)
    end
end

function draw_line(r::Robot, n::Integer, from_start::Bool)
    if from_start
        draw = true
        k = 0
    else
        draw = false
        k = n
    end
    flag = false
    while !flag
        if draw
            putmarker!(r)
            k += 1
        else
            k -= 1
        end
        if (k == 0 || k == n)
            draw = !draw
        end
        if isborder(r, Ost)
            flag = true
        else
            move!(r, Ost)
        end
    end
    while !isborder(r, West)
        move!(r, West)
    end
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
 
function return_to_spawn(r::Robot, steps_sud::Integer, steps_ost::Integer)
    for i in 1:steps_sud
        move!(r, Sud)
    end
    for i in 1:steps_ost
        move!(r, Ost)
    end
 end
 