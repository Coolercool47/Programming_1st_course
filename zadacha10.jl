function main(r::Robot, n::Integer)
    c_sud, c_west = get_to_border(r)
    draw_all(r, n)
    return_to_spawn(r, c_sud, c_west) 
 end
 
function draw_all(r::Robot, n::Integer)
    from_start = true
    cou = 0
    flag = false
    while !flag
        cou += 1
        draw_line(r, n, from_start)
        if cou == n
            cou = 0
            from_start = !from_start
        end
        if isborder(r, Nord)
            flag = true
        else
            move!(r, Nord)
        end
    end
    while !isborder(r, Sud)
        move!(r, Sud)
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
    count_sud = 0
    while !isborder(r, West)
        move!(r, West)
        count_west += 1
    end
    while !isborder(r, Sud)
        move!(r, Sud)
        count_sud += 1
    end
    return count_sud, count_west
end
 
function return_to_spawn(r::Robot, steps_nord::Integer, steps_ost::Integer)
    for i in 1:steps_nord
        move!(r, Nord)
    end
    for i in 1:steps_ost
        move!(r, Ost)
    end
 end
 