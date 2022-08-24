%lang starknet

@contract_interface
namespace ICar:
    func take_turn(grid_state_len : felt, grid_state : Cell*, ship_id : felt) -> (
        new_direction : Vector2
    ):
    end

    # ERC165
    func supportsInterface(interfaceId : felt) -> (success : felt):
    end
end
