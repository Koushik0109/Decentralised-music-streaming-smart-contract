Music Streaming Smart Contract
This is a smart contract for a decentralized music streaming platform on the Ethereum blockchain. It allows for the sharing and streaming of music, while also allowing for the buying and selling of songs.

Features
Add songs to the platform with a unique ID, name, artist, and price.
Buy songs using Ethereum.
View information about a song, including its name, artist, price and buyers.
Utilizes a mapping and an array to store and retrieve song information.
Emits an event when a song is added to the platform.
Functions
addSong(string memory name, address artist, uint price) public
This function is used to add a song to the platform. It takes in the name of the song, address of the artist and the price of the song. It creates a unique ID for the song using the keccak256 hash function and the current timestamp. It then adds the song to a mapping and an array for storage and retrieval. It also emits an event indicating that a song has been added to the platform.

buySong(bytes32 id) public payable
This function is used to buy a song. It takes in the unique ID of the song. It retrieves the song from the mapping and check if the msg.value is enough to buy the song. It then adds the msg.sender to the buyers array and transfer the song price to the artist.

viewSong(bytes32 id) public view returns (string memory name, address artist, uint price, address[] buyers)
This function is used to view information about a song. It takes in the unique ID of the song and returns the song's name, artist, price and buyers.

constructor() public
The constructor function is called when the contract is deployed. It sets the address of the contract owner to the address that deployed the contract.

Usage
To use this contract, first deploy it to the Ethereum blockchain. Then, call the addSong() function to add songs to the platform. Use the buySong() function to buy a song. Use the viewSong() function to view information about a song.

Note
Remember that smart contracts are immutable once deployed. So be careful before deploying, and test it in a test environment before deploying to the mainnet.

Additional Information
The contract is written in Solidity version 0.8.0.
The contract utilizes the abi.encodePacked() function to create a unique ID for a song.
The contract utilizes the keccak256() function to create a unique ID for a song.
The contract utilizes the now variable to create a unique ID for a song.
Conclusion
This contract serves as a simple example of how to create a decentralized music streaming platform on the Ethereum blockchain. It demonstrates the use of mappings and arrays for storage and retrieval of song information, and the use of events and functions for adding and buying songs. It can be used as a starting point for more advanced decentralized music streaming platforms, or for learning how to create smart contracts on the Ethereum blockchain.
