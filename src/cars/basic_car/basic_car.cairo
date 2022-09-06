%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from contracts.cars.basic_car.library import BasicCar

@external
func take_turn{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> () {
    return BasicCar.take_turn();
}
