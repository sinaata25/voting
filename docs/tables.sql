-- Table for voters
CREATE TABLE voters (
    voter_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Table for candidates
CREATE TABLE candidates (
    candidate_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    party VARCHAR(50) NOT NULL
);

-- Table for elections
CREATE TABLE elections (
    election_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL
);

-- Table for votes (transactions). 
-- References voters, candidates, and elections.
CREATE TABLE votes (
    vote_id SERIAL PRIMARY KEY,
    voter_id INTEGER NOT NULL REFERENCES voters(voter_id),
    candidate_id INTEGER NOT NULL REFERENCES candidates(candidate_id),
    election_id INTEGER NOT NULL REFERENCES elections(election_id),
    vote_timestamp TIMESTAMP NOT NULL
);

-- Table for blocks in the blockchain
CREATE TABLE blockchain (
    block_id SERIAL PRIMARY KEY,
    previous_block_id INTEGER REFERENCES blockchain(block_id),
    block_data TEXT NOT NULL,  -- This might contain a set of votes, for example
    block_hash TEXT NOT NULL,
    nonce INTEGER NOT NULL
);