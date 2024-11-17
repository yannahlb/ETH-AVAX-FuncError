# Project: Error Handling in Solidity Smart Contracts
The contract also showcases basic inventory management functionality, where users can set item details and update quantities, while handling potential errors. It demonstrates the use of various error handling mechanisms, such as require(), assert(), and revert().


## Description

The contract allows users to set an item’s name and quantity, as well as update the quantity (either adding or removing stock). It uses the three error-handling mechanisms—require(), assert(), and revert()—to validate user inputs and ensure the contract's internal logic is correct.

Key Features:
- ```require()```: Used to validate conditions like checking if an item name is provided and quantity is greater than zero.
- ```assert()```: Ensures that internal conditions are met such as checking if the item name was correctly set and if the updated quantity matches the expected value.
- ```revert()```: Explicitly reverts the transaction with a custom error message when conditions fail, preventing negative quantities.

The contract serves as an introductory sample to help Solidity beginners understand the importance of error handling and how to use it to protect the state of a smart contract from invalid interactions.

## Getting Started

### Executing the Program
To run the program, you can use an online Solidity IDE called Remix (https://remix.ethereum.org/) and follow the steps below: 

Go to the Remix website and create a new file by clicking on the "+" icon in the left-hand sidebar. Name the file SimpleInventory.sol.

Copy and paste the following code into your new file:
```
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
```
Click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" version is set to 0.8.18 (or another compatible version). Then click the "Compile SimpleInventory.sol" button.

After successfully compiling, navigate to the "Deploy & Run Transactions" tab. Select the specified contract from the dropdown menu, and click the "Deploy" button.

You can interact with the contract by using the setItem function to set the item's name and initial quantity, ensuring the name is not empty and the quantity is greater than zero to pass the require() validation. Use the updateQuantity function to update the item's stock. If the quantity goes negative, the revert() statement will cancel the transaction and show an error message. After updating the quantity, the assert() statement ensures that the quantity has been correctly updated. Use the getQuantity function to view the current name and quantity of the item.


## Authors

Reannah Lobaton

@yannahlb
