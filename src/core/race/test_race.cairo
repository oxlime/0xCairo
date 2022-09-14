%lang starknet

from src.core.race.library import race
from src.models.models import Context, CarInit

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.bool import TRUE, FALSE

const RAND_CONTRACT = 11111;
const MAX_TURN_COUNT = 1000;

func create_context_with_no_car(car_count: felt) -> (context: Context) {
    return race.create_context(RAND_CONTRACT, MAX_TURN_COUNT, car_count);
}

@external
func test_add_cars{syscall_ptr: felt*, range_check_ptr}() {
    alloc_locals;

    let (local cars: CarInit*) = alloc();
    assert cars[0].address = 'car1';
    assert cars[1].address = 'car2';

    let (context) = create_context_with_no_car(2);

    with context {
        race.add_cars(context.car_count, cars);
    }

    // Check context
    assert context.car_contracts[0] = 'car1';
    assert context.car_contracts[1] = 'car2';

    return ();
}
