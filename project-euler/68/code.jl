
function form_string(magic_5_gon)
    res = magic_5_gon[[1,2,3,4,3,5,6,5,7,8,7,9,10,9,2]]

    res = join(string.(res), "")

    res, length(res)
end


# generate 1,2,3
function find_magic_5_gon()
    for m1 in 1:6
        magic_5_gon = zeros(Int, 10)
        # 1 is set
        magic_5_gon[1] = m1
        for m4 in intersect(m1+1:10, setdiff(1:10, magic_5_gon))
            # 1, 4 is set
            magic_5_gon[4] = m4

            # unset 2:3 5:end
            magic_5_gon[2:3] .= 0
            magic_5_gon[5:end] .= 0
            for m2 in setdiff(1:10, magic_5_gon)
                # 1, 2, 4 is set
                magic_5_gon[2] = m2

                # unset 3 5:end
                magic_5_gon[3] = 0
                magic_5_gon[5:end] .= 0

                for m3 in setdiff(1:10, magic_5_gon)
                    # 1, 2, 3, 4 set
                    magic_5_gon[3] = m3

                    # unset 5:end
                    magic_5_gon[5:end] .= 0

                    total = sum(magic_5_gon[1:3])
                    m5 = total - m4 - m3
                    if m5 in setdiff(1:10, magic_5_gon)
                        magic_5_gon[5] = m5
                    else
                        continue
                    end

                    m7_min = minimum(setdiff(1:10, magic_5_gon))
                    m6_candidates = intersect(m1+1:10, setdiff(1:10, magic_5_gon), 1:total-m5-m7_min)
                    if length(m6_candidates) == 0
                        continue
                    end

                    for m6 in m6_candidates
                        # 1-6 set; 5 set above
                        magic_5_gon[6] = m6

                        # unset up
                        magic_5_gon[7:end] .= 0

                        m7 = total - m5 - m6
                        if m7 in setdiff(1:10, magic_5_gon)
                            magic_5_gon[7] = m7
                        else
                            continue
                        end

                        m9_min = minimum(setdiff(1:10, magic_5_gon))
                        m8_candidates = intersect(m1+1:10, setdiff(1:10, magic_5_gon), 1:total-m5-m9_min)
                        if length(m8_candidates) == 0
                            continue
                        end
                        for m8 in m8_candidates
                            magic_5_gon[8] = m8
                            magic_5_gon[9:end] .= 0

                            m9 = total - m7 - m8
                            if m9 in setdiff(1:10, magic_5_gon)
                                magic_5_gon[9] = m9
                            else
                                continue
                            end

                            m10 = total - m2 - m9
                            if m10 in setdiff(1:10, magic_5_gon)
                                magic_5_gon[10] = m10
                                println(magic_5_gon)
                                println(form_string(magic_5_gon))
                            end
                        end
                    end
                end
            end
        end
    end
    println("something's wrong")
end
