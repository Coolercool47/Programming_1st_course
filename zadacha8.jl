function main(r::Robot)
    find_marker(r)
end

function find_marker(r::Robot)
    count = 1
    num = 0
    while true
        for i in 1:count
            move!(r, HorizonSide(num))
            if ismarker(r)
                return
            end
        end
        num += 1
        count += (num - 1) % 2
        num %= 4
    end
end
