%lang starknet

struct CarInit {
    address: felt,
}

struct Player {
    player_address: felt,
    car_address: felt,
    team: felt,
}

struct Context {
    finish_distance: felt,
    rand_contract: felt,
    car_count: felt,
    car_contracts: felt*,
}

//
// Enums
//
struct GameState {
    WAITING: felt,
    ACTIVE: felt,
    DONE: felt,
}
