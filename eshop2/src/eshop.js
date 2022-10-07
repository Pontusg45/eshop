/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showMenu: showMenu,
    showCategory: showCategory,
    showProducts: showProducts,
    log: log,
    addProduct: addProduct,
    deleteProduct: deleteProduct,
    showInventory: showInventory,
    showSelfves: showSelfves,
    createProduct: createProduct,
    updateProduct: updateProduct,
    showSpecificProduct: showSpecificProduct,
    removeProduct: removeProduct,
    showCostumers: showCostumers,
    createOrder: createOrder,
    addToOrder: addToOrder,
    showOrders: showOrders,
    createPicklist: createPicklist,
    shipOrder: shipOrder
};

const mysql = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function () {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
* Shows table of teachers focused on kompetens.
*
* @returns {void} .
*/
function showMenu() {
    console.info(
        ` You can choose from the following commands.\n`
        + `  exit, quit, ctrl-d - to exit the program.\n`
        + `  help, menu            - to show this menu.\n`
        + `  logg <number>           - Show <number> latest loggs.\n`
        + `  shelf                   - Show shelfs.\n`
        + `  inventory                  - Shows inventory in lager.\n`
        + `  inventory <str>                     - Search in inventory.\n`
        + `  invadd <productid> <shelf> <number> - Add a product to inventory.\n`
        + `  invdel <productid> <shelf> <number> - Deletes product from inventory.\n`
        + `  order                              - Shows all orders.\n`
        + `  order <search>                     - Search for order.\n`
        + `  picklist <orderid>                 - Creates picklist for chosen order_id.\n`
        + `  shipOrder <orderid>                - Deletes product from inventory.\n`
        + `  anything else is treated as an unvalid command.`
    );
}

/**
 * Show all entries in the selected table.
 *
 * @async
 * @param {string} table A valid table name.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProducts() {
    let sql = `CALL show_products;`;
    let res;

    res = await db.query(sql);
    console.table(res[0]);

    return res;
}

/**
 * Show all shelves in lager.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showSelfves() {
    let sql = `CALL show_selfves`;
    let res;

    res = await db.query(sql);
    console.table(res[0]);

    return res;
}

/**
 * Adds a number of products to a shelf.
 *
 * @async
 * @param {int} id Product_id
 * @param {int} shelf Shelf where the product will be
 * @param {int} quantity How many products to add
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function addProduct(id, shelf, quantity) {
    let sql = `CALL add_product(?,?,?);`;

    await db.query(sql, [id, shelf, quantity]);
}

/**
 * Deletes a number of products from a shelf.
 *
 * @async
 * @param {int} id Product_id for the product to delete
 * @param {int} shelf Shelf from where the product will be deleted
 * @param {int} quantity How many products to delte
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function deleteProduct(id, shelf, quantity) {
    let sql = `CALL delete_product(?,?,?);`;
    //let res;

    await db.query(sql, [id, shelf, quantity]);
    //console.info(res);

    //return res;
}

/**
 * Show all pruducts in lager with an option to search for products
 *
 * @async
 * @param {string} Searchword optimal param to search for
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showInventory(str = "") {
    let sql = `CALL show_inventory(?, ?);`;
    let res;
    let like = `%${str}%`;

    res = await db.query(sql, [str, like]);
    console.table(res[0]);

    return res;
}

async function log(num) {
    let sql = `CALL logg(?);`;
    let res;

    res = await db.query(sql, [num]);
    console.table(res[0]);

    return res[0];
}

/**
 * Show all categories.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCategory() {
    let res;

    let sql = `CALL show_category;`;

    res = await db.query(sql);
    console.table(res[0]);

    return res;
}

/**
 * Add a new product.
 *
 * @async
 * @param {string} name      Name of product.
 * @param {string} category  Category of the product.
 * @param {string} price Price of the product.
 * @param {string} desc Description of the product.
 *
 * @returns {void}
 */
async function createProduct(name, category, price, desc, quantity) {
    let sql = `CALL create_product(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [name, category, price, desc, quantity]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}

/**
 * Edit a existed product.
 *
 * @async
 * @param {string} name      Name of product.
 * @param {string} category  Category of the product.
 * @param {string} price Price of the product.
 * @param {string} desc Description of the product.
 *
 * @returns {void}
 */
async function updateProduct(name, price, desc, id) {
    let sql = `CALL update_product(?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [name, price, desc, id]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}

/**
 * Shows a specific product.
 *
 * @async
 * @param {string} id ID of product.
 *
 * @returns {void}
 */
async function showSpecificProduct(id) {
    let sql = `CALL show_specific_product(?);`;
    let res;

    res = await db.query(sql, [id]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Removes a existed product.
 *
 * @async
 * @param {string} id ID of product.

 *
 * @returns {void}
 */
async function removeProduct(id) {
    let sql = `CALL remove_product(?);`;

    await db.query(sql, [id]);
    console.log(`Produkt med id:et ${id} är raderad`);
}

/**
 * Shows all costumers
 *
 * @async
 *
 * @returns {void}
 */
async function showCostumers() {
    let sql = `CALL show_costumers();`;
    let res;

    res = await db.query(sql);
    return res;
}

/**
 * Creates an order
 *
 * @async
 * @param id id of costumer
 *
 * @returns {void}
 */
async function createOrder(id) {
    let sql = `CALL create_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    return res;
}

/**
 * Shows all order
 *
 * @async
 * @param id Search on Id
 *
 * @returns {void}
 */
async function showOrders(id = 0) {
    let sql = `CALL show_full_orders(?);`;
    let res;

    res = await db.query(sql, [id]);
    console.table(res[0]);
    return res;
}

/**
 * Adds to an order
 *
 * @async
 * @param id Id for an order
 *
 * @returns {void}
 */
async function addToOrder(orderId, produktID, antal) {
    let sql = `CALL add_to_order(?, ?, ?);`;

    await db.query(sql, [orderId, produktID, antal]);
}

/**
 * Creates picklist
 *
 * @async
 * @param id Id for an order
 *
 * @returns {void}
 */
async function createPicklist(id) {
    let sql = `CALL create_picklist(?);`;
    let res;

    res = await db.query(sql, [id]);
    console.table(res[0]);
    return res;
}

/**
 * Shows all costumers
 *
 * @async
 * @param id Id for an order
 *
 * @returns {void}
 */
async function shipOrder(id) {
    let sql = `CALL ship_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    return res;
}
