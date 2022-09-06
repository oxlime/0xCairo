%lang starknet

@contract_interface
namespace ICar {
    func take_turn(race_state_len: felt, race_state: felt, car_id: felt) {
    }

    // ERC165
    func supportsInterface(interfaceId: felt) -> (success: felt) {
    }
}
