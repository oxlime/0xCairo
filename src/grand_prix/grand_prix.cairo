%lang starknet

// -----
// VIEWS
// -----
@view
func grand_prix_id{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    grand_prix_id: felt
) {
    return grand_prix.grand_prix_id();
}

@view
func grand_prix_name{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    grand_prix_name: felt
) {
    return grand_prix.grand_prix_name();
}

@view
func grand_prix_winner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    grand_prix_winner: Player
) {
    return grand_prix.grand_prix_winner();
}

@view
func reward_token_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    reward_token_address: felt
) {
    return grand_prix.reward_token_address();
}

@view
func boarding_pass_token_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    ) -> (boarding_pass_token_address: felt) {
    return grand_prix.boarding_pass_token_address();
}

@view
func rand_contract_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    rand_contract_address: felt
) {
    return grand_prix.rand_contract_address();
}

@view
func stage{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (stage: felt) {
    return grand_prix.stage();
}

@view
func reward_total_amount{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    reward_total_amount: Uint256
) {
    return grand_prix.reward_total_amount();
}

@view
func car_count_per_race{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    car_count_per_race: felt
) {
    return grand_prix.car_count_per_race();
}

@view
func required_total_car_count{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    ) -> (required_total_car_count: felt) {
    return grand_prix.required_total_car_count();
}

@view
func grid_size{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    grid_size: felt
) {
    return grand_prix.grid_size();
}

@view
func turn_count{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    turn_count: felt
) {
    return grand_prix.turn_count();
}

@view
func distance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    distance: felt
) {
    return grand_prix.distance();
}

@view
func car_count{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    car_count: felt
) {
    return grand_prix.car_count();
}

@view
func player_car{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    player_address: felt
) -> (player_car: felt) {
    return grand_prix.player_car(player_address);
}

@view
func car_player{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    car_address: felt
) -> (car_player: felt) {
    return grand_prix.car_player(car_address);
}

@view
func player_score{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    player_address: felt
) -> (player_score: felt) {
    return grand_prix.player_score(player_address);
}

@view
func played_race_count{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    played_race_count: felt
) {
    return grand_prix.played_race_count();
}
