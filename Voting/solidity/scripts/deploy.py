from brownie import accounts, Vote
import os


def deploy_Vote():
    account = accounts[0]
    # print(account)
    # print(os.getenv("CC")) access to .env variables
    vote = Vote.deploy({"from": account})
    print(vote)


def main():
    deploy_Vote()
