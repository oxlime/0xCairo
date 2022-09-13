%lang starknet

# ------------
# STORAGE VARS
# ------------

# Id of the grand_prix
@storage_var
func grand_prix_id_() -> (res : felt):
end

# Name of the grand_prix
@storage_var
func grand_prix_name_() -> (res : felt):
end

# Winner of the grand_prix
@storage_var
func grand_prix_winner_() -> (player : Player):
end
