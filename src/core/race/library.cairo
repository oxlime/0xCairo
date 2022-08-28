%lang starknet

# ------------------
# EVENTS
# ------------------

@event
func car_added(race_contract_address : felt, car_id : felt):
end

@event
func new_turn(race_contract_address : felt, turn_number : felt):
end

@event
func race_finished(race_contract_address : felt):
end


namespace race:
    func run_race{syscall_ptr : felt*, range_check_ptr}(
        rand_contract_address : felt,
        size : felt,
        turn_count : felt,
        distance : felt,
        cars_len : felt,
        cars : CarInit*,
    ) -> (scores_len : felt, scores : felt*):
        alloc_locals

        let (pos) = create_pos_array(cars_len)
        let (context) = race.create_context(
            rand_contract_address, distance, cars_len
        )

        with context, pos:
            race.add_cars(cars_len, cars)
            let current_turn = 0
            with current_turn:
                race.all_turns_loop()
            end
        end

        let (race_contract_address) = get_contract_address()
        race_finished.emit(race_contract_address)

        return (pos_len=cars_len, pos=pos)
    end

    func create_context(
        rand_contract_address : felt, distance : felt, cars_len : felt
    ) -> (context : Context):
        alloc_locals

        local context : Context
        let (car_addresses) = alloc()
        assert context.car_contracts = car_addresses
        assert context.car_count = cars_len
        assert context.finish_distance = distance 
        assert context.rand_contract = rand_contract_address

        return (context=context)
    end

end
