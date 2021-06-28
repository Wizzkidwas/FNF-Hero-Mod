-- this gets called starts when the level loads.
function start(song) -- arguments, the song name
    print("Mod Chart loaded")
end

-- this gets called every step
function stepHit(step) -- arguments, the current step of the song (4 steps are in a beat)
    if (step == 300)
        changeBoyfriendCharacter("bfrave")
        changeDadCharacter("herorave")
    end
end