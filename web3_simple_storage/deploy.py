import json
from web3 import Web3
from solc import compile_standard

with open("./SimpleStorage.sol", "r") as file:
    simple_storage_file = file.read()

# Solidity source code
compiled_sol = compile_standard(
    {
        "language": "Solidity",
        "sources": {"SimpleStorage.sol": {"content": simple_storage_file}},
        "settings": {
            "outputSelection": {
                "*": {
                    "*": ["abi", "metadata", "evm.bytecode", "evm.bytecode.sourceMap"]
                }
            }
        },
    }
)

with open("compiled_code.json", "w") as file:
    json.dump(compiled_sol, file)
