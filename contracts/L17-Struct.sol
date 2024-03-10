// You can define your own type by creating a struct.

// They are useful for grouping together related data.

// Structs can be declared outside of a contract and imported in another contract.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todos.push(todo);
    }
    
    // ######################################

    // The function in which a variable uses memeory, the value of that variable after function excted will be vanished
    // where as a function intilized as storage will be used for storing data on blockchain, and if we want to omit any data
    // on blockchain then we will use storage instead of memory.

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

// Declaring and importing Struct
// File that the struct is declared in

pragma solidity ^0.8;
// This is saved 'StructDeclaration.sol'

struct Todo {
    string text;
    bool completed;
}

// File that imports the struct above


pragma solidity ^0.8;

// import "./StructDeclaration.sol";

// contract Todos {
//     // An array of 'Todo' structs
//     Todo[] public todos; ------------- This is possible because Todo is imported in this contract.
// }