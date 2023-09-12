pragma solidity >=0.4.0 <0.8.6;

contract Vote {
    address owner; //owners address(devloper of contract)
    uint128 kandid_count = 0; //number of candidates
    mapping(uint => Kandid) List_Kandid;
    mapping(address => bool) Participaints;

    constructor() public {
        owner = msg.sender; //in constructor we should get and set owners address
    }

    struct Kandid {
        uint128 id;
        string name;
        uint200 num_vote; //number of votes
    }

    //owner of contract can add candidates with this function
    function addKandid(string memory name) public returns (string memory) {
        require(owner == msg.sender, "access denide"); //check if(myaddress=owner)= go ahead,else(break and exit from function)
        kandid_count++;
        List_Kandid[kandid_count] = Kandid(kandid_count, name, 0);
        return "kandid addedd";
    }

    function voteKandid(uint id) public returns (string memory) {
        require(id >= kandid_count && id > 0, "kandid not found");
        require(Participaints[msg.sender] == false, "you cant vote again!"); //everyone can vote once, else break
        List_Kandid[id].num_vote++;
        Participaints[msg.sender] = true;
        return "success";
    }

    function showWinner() public view returns (string memory) {
        uint winner_id = 0;
        uint winner_vote = 0;
        for (uint i = 0; i < kandid_count; i++) {
            if (List_Kandid[i].num_vote >= winner_vote) {
                winner_id = i;
                winner_vote = List_Kandid[i].num_vote;
            }
        }
        return List_Kandid[winner_id].name;
    }
}
