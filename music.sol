pragma solidity ^0.8.0;

contract MusicStreaming {
    // Define variables
    address public owner;
    mapping(bytes32 => Song) public songs;
    bytes32[] public songIds;

    // Event to trigger when a song is added to the platform
    event SongAdded(bytes32 indexed id, string name, address artist);

    // Struct to hold information about a song
    struct Song {
        string name;
        address artist;
        uint price;
        address[] buyers;
    }

    // Function to add a song to the platform
    function addSong(string memory name, address artist, uint price) public {
        // Create a unique ID for the song
        bytes32 id = keccak256(abi.encodePacked(name, artist, now));

        // Create a new song and add it to the mapping
        Song storage newSong = songs[id];
        newSong.name = name;
        newSong.artist = artist;
        newSong.price = price;

        // Add the song ID to the list of all song IDs
        songIds.push(id);

        // Trigger the SongAdded event
        emit SongAdded(id, name, artist);
    }

    // Function to buy a song
    function buySong(bytes32 id) public payable {
        // Retrieve the song from the mapping
        Song storage song = songs[id];

        // Check if the msg.value is enough to buy the song
        require(msg.value >= song.price);

        // Add the msg.sender to the buyers array
        song.buyers.push(msg.sender);

        // Transfer the song price to the artist
        song.artist.transfer(song.price);
    }

    // Function to view a song's information
    function viewSong(bytes32 id) public view returns (string memory name, address artist, uint price, address[] buyers) {
        // Retrieve the song from the mapping
        Song storage song = songs[id];

        // Return the song's information
        return (song.name, song.artist, song.price, song.buyers);
    }

    constructor() public {
        owner = msg.sender;
    }
}
