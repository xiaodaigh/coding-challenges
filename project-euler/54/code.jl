

function decode(card)
    val, suit = split(card, "")

    if val == "T"
        num_val = 10
    elseif val == "J"
        num_val = 11
    elseif val == "Q"
        num_val = 12
    elseif val == "K"
        num_val = 13
    elseif val == "A"
        num_val = 14
    else
        num_val = parse(Int, val)
    end
    num_val, suit
end

function same_suit(hand)
    length(Set(h[2] for h in hand))==1
end

using StatsBase

function score_hand(hand)::Tuple{Int, Int, Int, Int}
    # flush
    hand_cnt = countmap([h[1] for h in hand])

    if all(==(1), diff([h[1] for h in hand])) && same_suit(hand)
        return 9, hand[5][1], 0, 0
    elseif maximum(x->x[2], hand_cnt) == 4
        for (val, cnt) in hand_cnt
            if cnt == 4
                return 8, val, 0, 0
            end
        end
    elseif (maximum(x->x[2], hand_cnt) == 3) && (minimum(x->x[2], hand_cnt) == 2)
        for (val, cnt) in hand_cnt
            if cnt == 3
                return 7, val, 0, 0
            end
        end
    elseif same_suit(hand)
        return 6, hand[5][1], 0, 0
    elseif all(==(1), diff([h[1] for h in hand]))
        return 5, hand[5][1], 0, 0
    elseif maximum(x->x[2], hand_cnt) == 3
        for (val, cnt) in hand_cnt
            if cnt == 3
                return 4, val, 0, 0
            end
        end
    elseif (maximum(x->x[2], hand_cnt) == 2) && (length(hand_cnt) == 3)
        hand_cnt2 = [val for (val, cnt) in hand_cnt if cnt == 2]
        hand_cnt1 = [val for (val, cnt) in hand_cnt if cnt == 1]
        if hand_cnt2[1] > hand_cnt2[2]
            return 3, hand_cnt2[1], hand_cnt2[2], hand_cnt1[1]
        else
            return 3, hand_cnt2[2], hand_cnt2[1], hand_cnt1[1]
        end
    elseif (maximum(x->x[2], hand_cnt) == 2) && (length(hand_cnt) == 4)
        hand_cnt2 = [val for (val, cnt) in hand_cnt if cnt == 2]
        return 2, hand_cnt2[1], 0, 0
    else
        return 1, hand[5][1], 0, 0
    end
end

function cmp_hands(hand1, hand2)
    sh1 = score_hand(hand1)
    sh2 = score_hand(hand2)
    if sh1[1] > sh2[1]
        return true
    elseif sh1[1] < sh2[1]
        return false
    elseif sh1[2] > sh2[2]
        return true
    elseif sh1[2] < sh2[2]
        return false
    elseif sh1[3] > sh2[3]
        return true
    elseif sh1[3] < sh2[3]
        return false
    elseif sh1[4] > sh2[4]
        return true
    elseif sh1[4] < sh2[4]
        return false
    else
        for (h1, h2) in zip(reverse(hand1), reverse(hand2))
            if h1[1] > h2[1]
                return true
            elseif h1[1] < h2[1]
                return false
            end
        end
    end
    false
end

