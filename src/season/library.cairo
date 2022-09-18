%lang starknet

// Number of registered teams
@storage_var
func team_count_() -> (res: felt) {
}

// Team registered car
@storage_var
func team_car_(team_address: felt) -> (res: felt) {
}

// Car associated team 
@storage_var
func car_team_(car_address: felt) -> (res: felt) {

// Team scores
@storage_var
func team_score_(team_address: felt) -> (res: felt) {
}

// Number of grand prix count
@storage_var
func played_grand_prix_count_() -> (res: felt) {
}
