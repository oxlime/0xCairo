%lang starknet
from starkware.cairo.common.math import assert_nn
from starkware.cairo.common.cairo_builtins import HashBuiltin

# ------------------
# EXTERNAL FUNCTIONS
# ------------------

@external
func play{syscall_ptr : felt*, range_check_ptr}(
    rand_contract_address : felt,
    size : felt,
    turn_count : felt,
    cars_len : felt,
    cars : CarInit*,
) -> (scores_len : felt, scores : felt*):
    return race.play(rand_contract_address, size, turn_count, cars_len, cars)
end
