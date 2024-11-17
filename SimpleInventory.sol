// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleInventory {
    string public itemName; // Item name
    uint256 public itemQuantity; // Item quantity

    function setItem(string memory _name, uint256 _quantity) public {
        // To check item name is not empty
        require(bytes(_name).length > 0, "Item name cannot be empty");
        // To check item quantity is greater than zero
        require(_quantity > 0, "Quantity must be greater than zero");

        itemName = _name;
        itemQuantity = _quantity;

        // Confirm the item name is correctly set
        assert(keccak256(bytes(itemName)) == keccak256(bytes(_name)));
    }

    // Update item quantity (positive for adding, negative for removing)
    function updateQuantity(int256 _change) public {
        int256 newQuantity = int256(itemQuantity) + _change;

        // Ensures the new quantity doesn't go negative
        if (newQuantity < 0) {
            revert("Insufficient stock: Quantity cannot go negative");
        }

        itemQuantity = uint256(newQuantity);

        // Confirm the quantity is updated correctly
        assert(int256(itemQuantity) == newQuantity);
    }

    function getQuantity() public view returns (string memory, uint256) {
        return (itemName, itemQuantity);
    }
}
