%lang starknet

from starkware.starknet.common.syscalls import get_contract_address
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math_cmp import is_nn_le

from src.models.models import CarInit, Context
// from src.libraries.math_utils import math_utils

// ------------------
// EVENTS
// ------------------

@event
func car_added(race_contract_address: felt, car_id: felt) {
}

@event
func new_turn(race_contract_address: felt, turn_number: felt) {
}

@event
func shelled(race_contract_address: felt, smoked: felt, smoker: felt, amount: felt, cost: felt) {
}

@event
func race_finished(race_contract_address: felt) {
}

namespace race {
    func run_race{syscall_ptr: felt*, range_check_ptr}(
        rand_contract_address: felt,
        size: felt,
        turn_count: felt,
        distance: felt,
        cars_len: felt,
        cars: CarInit*,
    ) -> (scores_len: felt, scores: felt*) {
        alloc_locals;

        let (pos) = create_pos_array(cars_len);
        let (context) = race.create_context(rand_contract_address, distance, cars_len);

        with context, pos {
            race.add_cars(cars_len, cars);
            let current_turn = 0;
            with current_turn {
                race.all_turns_loop();
            }
        }

        let (race_contract_address) = get_contract_address();
        race_finished.emit(race_contract_address);

        return (pos_len=cars_len, pos=pos);
    }

    func create_context(rand_contract_address: felt, distance: felt, cars_len: felt) -> (
        context: Context
    ) {
        alloc_locals;

        local context: Context;
        let (car_addresses) = alloc();
        assert context.car_contracts = car_addresses;
        assert context.car_count = cars_len;
        assert context.finish_distance = distance;
        assert context.rand_contract = rand_contract_address;

        return (context=context);
    }

    func create_pos_array(pos_len: felt) -> (pos: felt*) {
        alloc_locals;

        let (new_array) = alloc();
        local pos: felt* = new_array;
        init_pos_loop(pos_len, pos);

        return (pos=pos);
    }

    func init_pos_loop(pos_len: felt, pos: felt*) {
        if (pos_len == 0) {
            return ();
        }

        assert [pos] = 0;
        return init_pos_loop(pos_len - 1, pos + 1);
    }

    func add_cars{syscall_ptr: felt*, range_check_ptr, context: Context}(
        cars_len: felt, cars: CarInit*
    ) {
        alloc_locals;

        if (cars_len == 0) {
            return ();
        }

        add_car_loop(cars_len, cars, 0);
        local context: Context = context;

        return ();
    }

    func add_car_loop{syscall_ptr: felt*, range_check_ptr, context: Context}(
        cars_len: felt, cars: CarInit*, car_index: felt
    ) {
        if (car_index == cars_len) {
            return ();
        }

        let car: CarInit = cars[car_index];
        add_car(car.position, car_index + 1);
        assert context.car_contracts[car_index] = car.address;

        return add_car_loop(cars_len, cars, car_index + 1);
    }

    func add_car{syscall_ptr: felt*, range_check_ptr}(car_id: felt) {
        alloc_locals;

        // Emit events
        let (race_contract_address) = get_contract_address();
        car_added.emit(race_contract_address, car_id);

        return ();
    }

    func one_turn{syscall_ptr: felt*, range_check_ptr, context: Context, current_turn, pos: felt*}(
        ) {
        alloc_locals;

        local syscall_ptr: felt* = syscall_ptr;
        pos.take_turn(context.car_contracts);

        return ();
    }

    func all_turns_loop{
        syscall_ptr: felt*,
        range_check_ptr,
        context: Context,
        distance: felt,
        current_turn: felt,
        pos: felt*,
    }() {
        if (current_turn == context.max_turn_count) {
            return ();  // end of the race
        }
        let (race_contract_address) = get_contract_address();
        new_turn.emit(race_contract_address, current_turn + 1);

        one_turn();

        let current_turn = current_turn + 1;

        return all_turns_loop();
    }
}
