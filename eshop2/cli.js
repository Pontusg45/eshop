/**
 * Terminalprogram mot mysql med kommandoloop
 */
"use strict";


const eshop = require("./src/eshop.js");

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/**
 * Main function.
 *
 * @returns voids
 */
(async function () {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    rl.setPrompt("Enter command: ");
    rl.prompt();
})();

/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
function handleInput(line) {
    line = line.trim();
    line = line.split(' ');
    switch (line[0]) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "help":
        case "menu":
            eshop.showMenu();
            break;
        case "logg":
            eshop.log(line[1]);
            break;
        case "invadd":
            eshop.addProduct(line[1], line[2], line[3]);
            break;
        case "invdel":
            eshop.deleteProduct(line[1], line[2], line[3]);
            break;
        case "inventory":
            eshop.showInventory(line[1]);
            break;
        case "shelf":
            eshop.showSelfves();
            break;
        case "order":
            eshop.showOrders(line[1]);
            break;
        case "picklist":
            eshop.createPicklist(line[1]);
            break;
        case "ship":
            eshop.shipOrder(line[1]);
            break;
        case "about":
            console.log("Pontus gustafsson");
            break;
        default:
            console.log("Unvalid command");
            rl.prompt();
    }
}



/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
