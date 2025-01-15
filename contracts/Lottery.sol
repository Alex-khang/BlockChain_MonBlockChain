// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] public players;
    
    // Sự kiện để thông báo khi có người thắng giải
    event Winner(address winner, uint256 prizeAmount);
    mapping(address => string) public playerName;
    address win;

    constructor() {
        manager = msg.sender;  // Người tạo hợp đồng sẽ là người quản lý xổ số
    }

    // Hàm để người tham gia xổ số
    function enter(string memory name) public payable {
        require(msg.value == 1 ether, "The ticket price is 0.1 ETH");

        // Thêm người chơi vào danh sách
        players.push(msg.sender);
        playerName[msg.sender] = name;
    }

    // Hàm để chọn người thắng cuộc
    function pickWinner() public restricted {
        uint256 index = random() % players.length;
        address winner = players[index];

        // Chuyển phần thưởng cho người thắng cuộc
        uint256 prizeAmount = address(this).balance;
        payable(winner).transfer(prizeAmount);

        win = winner;
        emit Winner(winner, prizeAmount);
        

        // Xóa danh sách người chơi sau mỗi lần xổ số
        delete players;
    }

    // Hàm để tạo số ngẫu nhiên
    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players)));
    }

    // Modifier chỉ cho phép người quản lý (manager) gọi hàm này
    modifier restricted() {
        require(msg.sender == manager, "Only the manager can pick a winner.");
        _;
    }

    // Hàm để lấy số lượng người chơi
    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function getWinner() public view returns(string memory) {
        return playerName[win];
    }
}
