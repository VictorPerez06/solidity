#!/usr/bin/python3
from brownie import SimpleCollectible, accounts, network, config
from scripts.helpful_scripts import get_publish_source

def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    simple_collectible = SimpleCollectible[len(SimpleCollectible) - 1]
    token_id = 0
    txn = simple_collectible.setTokenURI(0, "https://ipfs.io/ipfs/QmQ9CKyGFcoQ44QguSwH2Z83k64G34twve5nNdM1GzfRmR?filename=5-MARS.json", {"from": dev})
    txn.wait(1)

