%lang starknet

struct CarInit:
    member address : felt
end

struct Player:
    member player_address : felt
    member car_address : felt
    member team : felt
end

struct Context:
    member finish_distance : felt
    member rand_contract : felt
    member car_count : felt
    member car_contracts : felt*
end

#
# Enums
#
struct GameState:
    member WAITING : felt
    member ACTIVE : felt
    member DONE : felt
end
