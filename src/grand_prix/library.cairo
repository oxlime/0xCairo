%lang starknet

// ------------
// STORAGE VARS
// ------------

// Id of the grand_prix
@storage_var
func grand_prix_id_() -> (res: felt) {
}

// Name of the grand_prix
@storage_var
func grand_prix_name_() -> (res: felt) {
}

// Winner of the grand_prix
@storage_var
func grand_prix_winner_() -> (player: Player) {
}

// Race contract address
@storage_var
func race_contract_address_() -> (res: felt) {
}

// Number of cars per race
@storage_var
func cars_count_per_race_() -> (res: felt) {
}

// Number of cars per grand_prix
@storage_var
func required_total_car_count_() -> (res: felt) {
}

// Turn count per race
@storage_var
func turn_count_() -> (res: felt) {
}

// Distance per race
@storage_var
func distance_() -> (res: felt) {
}

// Number of registered cars
@storage_var
func car_count_() -> (res: felt) {
}

// Player registered car
@storage_var
func player_car_(player_address: felt) -> (res: felt) {
}

// Car associated player
@storage_var
func car_player_(car_address: felt) -> (res: felt) {
}

// Car array
@storage_var
func cars_(index: felt) -> (car_address: felt) {
}

// Array of cars playing during the current round
@storage_var
func playing_cars_(index: felt) -> (car_address: felt) {
}

@storage_var
func playing_car_count_() -> (res: felt) {
}

// Index in playing_cars_ array pointing to the first car that will play the next race
@storage_var
func next_playing_car_index_() -> (index: felt) {
}

// Array of cars that won their race in the current round
@storage_var
func winning_cars_(index: felt) -> (car_address: felt) {
}
@storage_var
func winning_car_count_() -> (res: felt) {
}

// Current round number
@storage_var
func current_round_() -> (res: felt) {
}

// Player scores
@storage_var
func player_score_(player_address: felt) -> (res: felt) {
}

// Played race count
@storage_var
func played_race_count_() -> (res: felt) {
}

// Current stage of the grand prix
@storage_var
func current_stage_() -> (state: felt) {
}
