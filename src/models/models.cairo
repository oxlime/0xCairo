%lang starknet

struct CarInit:
    member address : felt
end

struct Player:
    member player_address : felt
    member car_address : felt
    member team : felt
end
