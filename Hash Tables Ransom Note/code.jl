

# Complete the checkMagazine function below.
function checkMagazine(magazine, note)
    mdict = Dict{String, Int}()
    for mag in magazine
        if haskey(mdict, mag)
            mdict[mag] += 1
        else
            mdict[mag] = 1
        end
    end

    ndict = Dict{String, Int}()
    for mag in note
        if haskey(mdict, mag)
            if haskey(ndict, mag)
                ndict[mag] += 1
            else
                ndict[mag] = 1
            end
        else
            return "No"
        end
    end

    for (key, val) in ndict
        if haskey(mdict, key)
            if mdict[key] < val
                return "No"
            end
        else
            return "No"
        end
    end
    "Yes"
end

mn = split(readline(stdin))

m = parse(Int32, mn[1])

n = parse(Int32, mn[2])

magazine = Array{String}(split(readline(stdin)))

note = Array{String}(split(readline(stdin)))

println(checkMagazine(magazine, note))
