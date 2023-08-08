contract PaperOwnership {
    mapping(uint256 => address) public paperToOwner;
    mapping(address => uint256[]) public ownerToPapers;

    event PaperTransfer(uint256 indexed paperId, address from, address to);

    function transferPaper(uint256 _paperId, address _to) external {
        address from = paperToOwner[_paperId];
        require(from == msg.sender, "You are not the owner of this paper.");
        require(_to != address(0), "Invalid recipient address.");

        paperToOwner[_paperId] = _to;

        uint256[] storage ownerPapers = ownerToPapers[_to];
        ownerPapers.push(_paperId);
        ownerToPapers[from] = removePaperFromArray(ownerToPapers[from], _paperId);

        emit PaperTransfer(_paperId, from, _to);
    }

    // Utility function to remove a paper from an array
    function removePaperFromArray(uint256[] storage arr, uint256 value)
        internal
        returns (uint256[] storage)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == value) {
                if (i != arr.length - 1) {
                    arr[i] = arr[arr.length - 1];
                }
                arr.pop();
                break;
            }
        }
        return arr;
    }
}
