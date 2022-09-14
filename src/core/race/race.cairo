%lang starknet

from src.core.race.library import race
from src.models.common import CarInit

// ------------------
// EXTERNAL FUNCTIONS
// ------------------

@external
func play_game{syscall_ptr: felt*, range_check_ptr}(
    rand_contract_address: felt,
    size: felt,
    turn_count: felt,
    distance: felt,
    cars_len: felt,
    cars: CarInit*,
) -> (scores_len: felt, scores: felt*) {
    return race.play_game(rand_contract_address, size, turn_count, cars_len, cars);
}
