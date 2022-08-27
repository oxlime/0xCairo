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
        cars_len : felt,
        cars : CarInit*,
    ) -> (scores_len : felt, scores : felt*):
        alloc_locals
        
        race.all_turn_loop()

        let (race_contract_address) = get_contract_address()
        race_finished.emit(race_contract_address)

        return (scores_len=cars_len, scores=scores)
    end

