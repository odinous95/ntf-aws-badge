-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil zktest

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
DEFAULT_ZKSYNC_LOCAL_KEY := 0x7726827caac94a7f9e1b160f7ea819f172f7b6f9d2a97f992c38edeab82d4110
# Local (Anvil) network deploy
DEPLOY_ANVIL_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast
# Sepolia network deploy
DEPLOY_SEPOLIA_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

build:; forge build

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1


deploy-anvil:
	@forge script script/DeployContract.s.sol:DeployContract $(DEPLOY_ANVIL_ARGS)

deploy-sepolia:
	@forge script script/DeployContract.s.sol:DeployContract $(DEPLOY_SEPOLIA_ARGS)

mint:
	@forge script script/Interactions.s.sol:MintCertNFT  ${NETWORK_ARGS}
